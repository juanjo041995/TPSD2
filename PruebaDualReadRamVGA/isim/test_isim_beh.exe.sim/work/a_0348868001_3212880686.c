/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/GitHubRepos/TPSD2/PruebaDualReadRamVGA/Pinta_IMG.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_0348868001_3212880686_p_0(char *t0)
{
    char t6[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    int t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    int t15;
    int t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (9 - 9);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 9;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t9 = (0 - 9);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t1, t6);
    t8 = (t0 + 2448U);
    t12 = *((char **)t8);
    t8 = (t12 + 0);
    *((int *)t8) = t11;
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = (9 - 9);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 9;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t9 = (0 - 9);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t1, t6);
    t8 = (t0 + 2568U);
    t12 = *((char **)t8);
    t8 = (t12 + 0);
    *((int *)t8) = t11;
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 2448U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t11 = (t9 / 160);
    t1 = (t0 + 2688U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = t11;
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t11 = (t9 / 240);
    t1 = (t0 + 2808U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = t11;
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t13 = *((unsigned char *)t2);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(63, ng0);
    t1 = xsi_get_transient_memory(3U);
    memset(t1, 0, 3U);
    t2 = t1;
    memset(t2, (unsigned char)2, 3U);
    t7 = (t0 + 4312);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 3U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(64, ng0);
    t1 = xsi_get_transient_memory(3U);
    memset(t1, 0, 3U);
    t2 = t1;
    memset(t2, (unsigned char)2, 3U);
    t7 = (t0 + 4376);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 3U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(65, ng0);
    t1 = xsi_get_transient_memory(2U);
    memset(t1, 0, 2U);
    t2 = t1;
    memset(t2, (unsigned char)2, 2U);
    t7 = (t0 + 4440);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 2U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 6984);
    t7 = (t0 + 4504);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 3U);
    xsi_driver_first_trans_fast_port(t7);

LAB3:    t1 = (t0 + 4232);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2688U);
    t7 = *((char **)t1);
    t9 = *((int *)t7);
    t1 = (t0 + 2808U);
    t8 = *((char **)t1);
    t11 = *((int *)t8);
    t15 = (t11 * 4);
    t16 = (t9 + t15);
    t1 = (t0 + 2928U);
    t12 = *((char **)t1);
    t1 = (t12 + 0);
    *((int *)t1) = t16;
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = (7 - 7);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t7 = (t0 + 4312);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 3U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = (7 - 4);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t7 = (t0 + 4376);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 3U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = (7 - 1);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t7 = (t0 + 4440);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 2U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t1 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t6, t9, 3);
    t7 = (t0 + 4504);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t1, 3U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB3;

}


extern void work_a_0348868001_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0348868001_3212880686_p_0};
	xsi_register_didat("work_a_0348868001_3212880686", "isim/test_isim_beh.exe.sim/work/a_0348868001_3212880686.didat");
	xsi_register_executes(pe);
}
