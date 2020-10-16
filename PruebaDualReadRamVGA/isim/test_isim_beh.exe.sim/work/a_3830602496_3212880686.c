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
static const char *ng0 = "D:/GitHubRepos/TPSD2/PruebaDualReadRamVGA/RAM.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_3830602496_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t4 = 1;
    if (3U == 3U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 5832);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 5672);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(56, ng0);
    t7 = (t0 + 5832);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    goto LAB3;

LAB5:    t5 = 0;

LAB8:    if (t5 < 3U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t1 = (t2 + t5);
    t6 = (t3 + t5);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

}

static void work_a_3830602496_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 9108U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t2);
    t5 = (t4 >= 0);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 5896);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB3:    t2 = (t0 + 5688);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(64, ng0);
    t10 = (t0 + 5896);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB5:    t6 = (t0 + 1832U);
    t7 = *((char **)t6);
    t6 = (t0 + 9108U);
    t8 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t7, t6);
    t9 = (t8 <= 7);
    t1 = t9;
    goto LAB7;

}

static void work_a_3830602496_3212880686_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 9092U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t2);
    t5 = (t4 >= 0);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 5960);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB3:    t2 = (t0 + 5704);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(73, ng0);
    t10 = (t0 + 5960);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB5:    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t6 = (t0 + 9092U);
    t8 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t7, t6);
    t9 = (t8 <= 7);
    t1 = t9;
    goto LAB7;

}

static void work_a_3830602496_3212880686_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1152U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5720);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(83, ng0);
    t4 = (t0 + 2632U);
    t10 = *((char **)t4);
    t11 = *((unsigned char *)t10);
    t12 = (t11 == (unsigned char)3);
    if (t12 == 1)
        goto LAB14;

LAB15:    t9 = (unsigned char)0;

LAB16:    if (t9 == 1)
        goto LAB11;

LAB12:    t8 = (unsigned char)0;

LAB13:    if (t8 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1192U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(84, ng0);
    t4 = (t0 + 1992U);
    t19 = *((char **)t4);
    t4 = (t0 + 1832U);
    t20 = *((char **)t4);
    t4 = (t0 + 9108U);
    t21 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t20, t4);
    t22 = (t21 - 0);
    t23 = (t22 * 1);
    t24 = (8U * t23);
    t25 = (0U + t24);
    t26 = (t0 + 6024);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t19, 8U);
    xsi_driver_first_trans_delta(t26, t25, 8U, 0LL);
    goto LAB9;

LAB11:    t4 = (t0 + 1352U);
    t16 = *((char **)t4);
    t17 = *((unsigned char *)t16);
    t18 = (t17 == (unsigned char)3);
    t8 = t18;
    goto LAB13;

LAB14:    t4 = (t0 + 1032U);
    t13 = *((char **)t4);
    t14 = *((unsigned char *)t13);
    t15 = (t14 == (unsigned char)3);
    t9 = t15;
    goto LAB16;

}

static void work_a_3830602496_3212880686_p_4(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(92, ng0);
    t3 = (t0 + 2632U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(95, ng0);
    t3 = (t0 + 9297);
    t7 = (t0 + 6088);
    t10 = (t7 + 56U);
    t13 = *((char **)t10);
    t14 = (t13 + 56U);
    t20 = *((char **)t14);
    memcpy(t20, t3, 8U);
    xsi_driver_first_trans_fast_port(t7);

LAB3:    t3 = (t0 + 5736);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(93, ng0);
    t3 = (t0 + 2472U);
    t13 = *((char **)t3);
    t3 = (t0 + 1832U);
    t14 = *((char **)t3);
    t3 = (t0 + 9108U);
    t15 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t14, t3);
    t16 = (t15 - 0);
    t17 = (t16 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, t15);
    t18 = (8U * t17);
    t19 = (0 + t18);
    t20 = (t13 + t19);
    t21 = (t0 + 6088);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t20, 8U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB3;

LAB5:    t3 = (t0 + 1512U);
    t10 = *((char **)t3);
    t11 = *((unsigned char *)t10);
    t12 = (t11 == (unsigned char)3);
    t1 = t12;
    goto LAB7;

LAB8:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t2 = t9;
    goto LAB10;

}

static void work_a_3830602496_3212880686_p_5(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    char *t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 2792U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 9313);
    t6 = (t0 + 6152);
    t10 = (t6 + 56U);
    t14 = *((char **)t10);
    t17 = (t14 + 56U);
    t20 = *((char **)t17);
    memcpy(t20, t2, 8U);
    xsi_driver_first_trans_fast_port(t6);

LAB3:    t2 = (t0 + 5752);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 1352U);
    t10 = *((char **)t2);
    t11 = *((unsigned char *)t10);
    t12 = (t11 == (unsigned char)2);
    if (t12 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 1352U);
    t14 = *((char **)t2);
    t15 = *((unsigned char *)t14);
    t16 = (t15 == (unsigned char)3);
    if (t16 == 1)
        goto LAB14;

LAB15:    t13 = (unsigned char)0;

LAB16:    t9 = t13;

LAB13:    if (t9 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 9305);
    t6 = (t0 + 6152);
    t10 = (t6 + 56U);
    t14 = *((char **)t10);
    t17 = (t14 + 56U);
    t20 = *((char **)t17);
    memcpy(t20, t2, 8U);
    xsi_driver_first_trans_fast_port(t6);

LAB9:    goto LAB3;

LAB5:    t2 = (t0 + 1032U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    t1 = t8;
    goto LAB7;

LAB8:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2472U);
    t20 = *((char **)t2);
    t2 = (t0 + 1672U);
    t21 = *((char **)t2);
    t2 = (t0 + 9092U);
    t22 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t21, t2);
    t23 = (t22 - 0);
    t24 = (t23 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, t22);
    t25 = (8U * t24);
    t26 = (0 + t25);
    t27 = (t20 + t26);
    t28 = (t0 + 6152);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t27, 8U);
    xsi_driver_first_trans_fast_port(t28);
    goto LAB9;

LAB11:    t9 = (unsigned char)1;
    goto LAB13;

LAB14:    t2 = (t0 + 2952U);
    t17 = *((char **)t2);
    t18 = *((unsigned char *)t17);
    t19 = (t18 == (unsigned char)2);
    t13 = t19;
    goto LAB16;

}


extern void work_a_3830602496_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3830602496_3212880686_p_0,(void *)work_a_3830602496_3212880686_p_1,(void *)work_a_3830602496_3212880686_p_2,(void *)work_a_3830602496_3212880686_p_3,(void *)work_a_3830602496_3212880686_p_4,(void *)work_a_3830602496_3212880686_p_5};
	xsi_register_didat("work_a_3830602496_3212880686", "isim/test_isim_beh.exe.sim/work/a_3830602496_3212880686.didat");
	xsi_register_executes(pe);
}
