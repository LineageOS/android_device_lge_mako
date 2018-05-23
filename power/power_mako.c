/*
 * Copyright (C) 2014 The Android Open Source Project
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <stdlib.h>

#define LOG_TAG "PowerHAL"
#include <utils/Log.h>

#include <hardware/hardware.h>
#include <hardware/power.h>

#define BOOST_PATH "/sys/devices/system/cpu/cpufreq/interactive/boost"
#define LIMIT_PATH "/sys/devices/system/cpu/cpufreq/interactive/hispeed_freq"

#define NORMAL_FREQ "1512000"
#define LIMIT_FREQ  "1026000"

static bool low_power_mode = false;

static int sysfs_write(const char *path, char *s)
{
    char buf[80];
    int len;
    int fd = open(path, O_WRONLY);

    if (fd < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
        return -1;
    }

    len = write(fd, s, strlen(s));

    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);
        return -1;
    }

    close(fd);
    return 0;
}

static void power_init(__attribute__((unused)) struct power_module *module)
{
    /* TODO: Add support for this? */
    ALOGI("%s", __func__);
}

static void power_set_interactive(__attribute__((unused)) struct power_module *module, int on)
{
    /* TODO: Add support for this? */
    ALOGV("%s %s", __func__, (on ? "ON" : "OFF"));
}

static void power_hint( __attribute__((unused)) struct power_module *module,
                      power_hint_t hint, void *data)
{
    switch (hint) {
        case POWER_HINT_INTERACTION:
        case POWER_HINT_LAUNCH:
            ALOGV("POWER_HINT_INTERACTION");
            if (!low_power_mode) /* No boost if low power mode is active. */
                sysfs_write(BOOST_PATH, "1");
            break;

        case POWER_HINT_LOW_POWER:
             ALOGI("POWER_HINT_LOW_POWER");
             if (data) {
                 low_power_mode = true;
                 sysfs_write(LIMIT_PATH, LIMIT_FREQ);
             } else {
                 low_power_mode = false;
                 sysfs_write(LIMIT_PATH, NORMAL_FREQ);
             }
             break;

        default:
             break;
    }
}

static int power_open(__attribute__((unused)) const hw_module_t *module, const char *name,
                            hw_device_t **device)
{
    ALOGD("%s: enter; name=%s", __FUNCTION__, name);

    int retval = 0; /* 0 is ok; -1 is error */

    if (strcmp(name, POWER_HARDWARE_MODULE_ID) == 0) {
        power_module_t *dev = (power_module_t *)calloc(1,
                sizeof(power_module_t));
        if (dev) {
            /* Common hw_device_t fields */
            dev->common.tag = HARDWARE_MODULE_TAG;
            dev->common.module_api_version = POWER_MODULE_API_VERSION_0_2;
            dev->common.module_api_version = HARDWARE_HAL_API_VERSION;
            dev->init = power_init;
            dev->powerHint = power_hint;
            dev->setInteractive = power_set_interactive;
            *device = (hw_device_t*)dev;
        } else
            retval = -ENOMEM;
    } else {
        retval = -EINVAL;
    }

    ALOGD("%s: exit %d", __FUNCTION__, retval);
    return retval;
}

static struct hw_module_methods_t power_module_methods = {
    .open = power_open,
};

struct power_module HAL_MODULE_INFO_SYM = {
    .common = {
        .tag = HARDWARE_MODULE_TAG,
        .module_api_version = POWER_MODULE_API_VERSION_0_2,
        .hal_api_version = HARDWARE_HAL_API_VERSION,
        .id = POWER_HARDWARE_MODULE_ID,
        .name = "Mako Power HAL",
        .author = "The Android Open Source Project",
        .methods = &power_module_methods,
    },

    .init = power_init,
    .setInteractive = power_set_interactive,
    .powerHint = power_hint,
};
