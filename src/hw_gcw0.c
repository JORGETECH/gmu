/*
 * Gmu Music Player
 *
 * Copyright (c) 2013-2018 Denis Kuznetsov (denis.n.kuznetsov@gmail.com)
 *
 * File: hw_gcw0.c  Created: 131018
 *
 * Description: GCW Zero specific stuff (button mapping etc.)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2 of
 * the License. See the file COPYING in the Gmu's main directory
 * for details.
 */

#include <stdio.h>
#include "hw_gcw0.h"
#include "oss_mixer.h"
#include "debug.h"

static int display_on_value = 100;
static int selected_mixer = -1;

int hw_open_mixer(int mixer_channel)
{
	int res = oss_mixer_open();
	selected_mixer = mixer_channel;
	wdprintf(V_INFO, "hw_gcw0", "Selected mixer: %d\n", selected_mixer);
	return res;
}

void hw_close_mixer(void)
{
	oss_mixer_close();
}

void hw_set_volume(int volume)
{
	if (selected_mixer >= 0) {
		if (volume >= 0) oss_mixer_set_volume(selected_mixer, volume);
	} else {
		wdprintf(V_INFO, "hw_gcw0", "No suitable mixer available.\n");
	}
}

void hw_display_off(void)
{
	FILE *f;

	wdprintf(V_DEBUG, "hw_gcw0", "Display off requested.\n");
	if ((f = fopen("/sys/class/graphics/fb0/blank", "w"))) {
		fprintf(f, "1\n");
		fclose(f);
	}
	display_on_value = -1;
}

void hw_display_on(void)
{
	FILE *f;

	wdprintf(V_DEBUG, "hw_gcw0", "Display on requested.\n");
	if ((f = fopen("/sys/class/graphics/fb0/blank", "w"))) {
		fprintf(f, "0\n");
		fclose(f);
	}
}

void hw_detect_device_model(void)
{
}

const char *hw_get_device_model_name(void)
{
	return "GCW Zero";
}
