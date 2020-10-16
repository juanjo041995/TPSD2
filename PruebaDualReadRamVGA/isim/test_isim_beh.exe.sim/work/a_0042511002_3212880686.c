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
static const char *ng0 = "D:/GitHubRepos/TPSD2/PruebaDualReadRamVGA/VGA_Sync.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_0042511002_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    int t11;
    int t12;
    int t13;
    int t14;
    char *t15;
    int t16;
    int t17;
    char *t18;
    int t19;
    int t20;
    int t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    int t27;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5568);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 5680);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 640;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 5744);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 480;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t11 = *((int *)t6);
    t2 = (t0 + 2928U);
    t7 = *((char **)t2);
    t12 = *((int *)t7);
    t2 = (t0 + 3048U);
    t8 = *((char **)t2);
    t13 = *((int *)t8);
    t14 = (t12 + t13);
    t2 = (t0 + 3168U);
    t15 = *((char **)t2);
    t16 = *((int *)t15);
    t17 = (t14 + t16);
    t2 = (t0 + 3288U);
    t18 = *((char **)t2);
    t19 = *((int *)t18);
    t20 = (t17 + t19);
    t21 = (t20 - 1);
    t22 = (t11 == t21);
    if (t22 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t12 = (t11 + 1);
    t1 = (t0 + 5680);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);

LAB11:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t1 = (t0 + 2928U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t1 = (t0 + 3048U);
    t6 = *((char **)t1);
    t13 = *((int *)t6);
    t14 = (t12 + t13);
    t1 = (t0 + 3168U);
    t7 = *((char **)t1);
    t16 = *((int *)t7);
    t17 = (t14 + t16);
    t1 = (t0 + 3288U);
    t8 = *((char **)t1);
    t19 = *((int *)t8);
    t20 = (t17 + t19);
    t21 = (t20 - 1);
    t3 = (t11 == t21);
    if (t3 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t12 = (t11 + 1);
    t1 = (t0 + 5808);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);

LAB17:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t1 = (t0 + 3528U);
    t6 = *((char **)t1);
    t13 = *((int *)t6);
    t14 = (t12 + t13);
    t4 = (t11 >= t14);
    if (t4 == 1)
        goto LAB25;

LAB26:    t3 = (unsigned char)0;

LAB27:    if (t3 != 0)
        goto LAB22;

LAB24:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 5936);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB23:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t1 = (t0 + 2928U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t1 = (t0 + 3048U);
    t6 = *((char **)t1);
    t13 = *((int *)t6);
    t14 = (t12 + t13);
    t4 = (t11 >= t14);
    if (t4 == 1)
        goto LAB31;

LAB32:    t3 = (unsigned char)0;

LAB33:    if (t3 != 0)
        goto LAB28;

LAB30:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 6000);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB29:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t1 = (t0 + 2928U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t4 = (t11 < t12);
    if (t4 == 1)
        goto LAB37;

LAB38:    t3 = (unsigned char)0;

LAB39:    if (t3 != 0)
        goto LAB34;

LAB36:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 6064);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB35:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 5680);
    t23 = (t2 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    *((int *)t26) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t1 = (t0 + 3528U);
    t6 = *((char **)t1);
    t13 = *((int *)t6);
    t14 = (t12 + t13);
    t1 = (t0 + 3648U);
    t7 = *((char **)t1);
    t16 = *((int *)t7);
    t17 = (t14 + t16);
    t1 = (t0 + 3768U);
    t8 = *((char **)t1);
    t19 = *((int *)t8);
    t20 = (t17 + t19);
    t21 = (t20 - 1);
    t3 = (t11 == t21);
    if (t3 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t12 = (t11 + 1);
    t1 = (t0 + 5744);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);

LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 5744);
    t15 = (t1 + 56U);
    t18 = *((char **)t15);
    t23 = (t18 + 56U);
    t24 = *((char **)t23);
    *((int *)t24) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB14;

LAB16:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 5808);
    t15 = (t1 + 56U);
    t18 = *((char **)t15);
    t23 = (t18 + 56U);
    t24 = *((char **)t23);
    *((int *)t24) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t1 = (t0 + 3408U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t1 = (t0 + 3528U);
    t6 = *((char **)t1);
    t13 = *((int *)t6);
    t14 = (t12 + t13);
    t1 = (t0 + 3648U);
    t7 = *((char **)t1);
    t16 = *((int *)t7);
    t17 = (t14 + t16);
    t1 = (t0 + 3768U);
    t8 = *((char **)t1);
    t19 = *((int *)t8);
    t20 = (t17 + t19);
    t21 = (t20 - 1);
    t3 = (t11 == t21);
    if (t3 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t11 = *((int *)t2);
    t12 = (t11 + 1);
    t1 = (t0 + 5872);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);

LAB20:    goto LAB17;

LAB19:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 5872);
    t15 = (t1 + 56U);
    t18 = *((char **)t15);
    t23 = (t18 + 56U);
    t24 = *((char **)t23);
    *((int *)t24) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB20;

LAB22:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 5936);
    t23 = (t1 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB23;

LAB25:    t1 = (t0 + 2312U);
    t7 = *((char **)t1);
    t16 = *((int *)t7);
    t1 = (t0 + 3408U);
    t8 = *((char **)t1);
    t17 = *((int *)t8);
    t1 = (t0 + 3528U);
    t15 = *((char **)t1);
    t19 = *((int *)t15);
    t20 = (t17 + t19);
    t1 = (t0 + 3768U);
    t18 = *((char **)t1);
    t21 = *((int *)t18);
    t27 = (t20 + t21);
    t9 = (t16 < t27);
    t3 = t9;
    goto LAB27;

LAB28:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 6000);
    t23 = (t1 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB29;

LAB31:    t1 = (t0 + 2152U);
    t7 = *((char **)t1);
    t16 = *((int *)t7);
    t1 = (t0 + 2928U);
    t8 = *((char **)t1);
    t17 = *((int *)t8);
    t1 = (t0 + 3048U);
    t15 = *((char **)t1);
    t19 = *((int *)t15);
    t20 = (t17 + t19);
    t1 = (t0 + 3288U);
    t18 = *((char **)t1);
    t21 = *((int *)t18);
    t27 = (t20 + t21);
    t9 = (t16 < t27);
    t3 = t9;
    goto LAB33;

LAB34:    xsi_set_current_line(99, ng0);
    t1 = (t0 + 6064);
    t8 = (t1 + 56U);
    t15 = *((char **)t8);
    t18 = (t15 + 56U);
    t23 = *((char **)t18);
    *((unsigned char *)t23) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB35;

LAB37:    t1 = (t0 + 2312U);
    t6 = *((char **)t1);
    t13 = *((int *)t6);
    t1 = (t0 + 3408U);
    t7 = *((char **)t1);
    t14 = *((int *)t7);
    t9 = (t13 < t14);
    t3 = t9;
    goto LAB39;

}

static void work_a_0042511002_3212880686_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(105, ng0);

LAB3:    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t1, t4, 10);
    t5 = (t0 + 6128);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 10U);
    xsi_driver_first_trans_fast_port(t5);

LAB2:    t10 = (t0 + 5584);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0042511002_3212880686_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(106, ng0);

LAB3:    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t1, t4, 10);
    t5 = (t0 + 6192);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 10U);
    xsi_driver_first_trans_fast_port(t5);

LAB2:    t10 = (t0 + 5600);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0042511002_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0042511002_3212880686_p_0,(void *)work_a_0042511002_3212880686_p_1,(void *)work_a_0042511002_3212880686_p_2};
	xsi_register_didat("work_a_0042511002_3212880686", "isim/test_isim_beh.exe.sim/work/a_0042511002_3212880686.didat");
	xsi_register_executes(pe);
}
