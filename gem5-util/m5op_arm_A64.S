/*
 * Copyright (c) 2010-2013 ARM Limited
 * All rights reserved
 *
 * The license below extends only to copyright in the software and shall
 * not be construed as granting a license to any other intellectual
 * property including but not limited to intellectual property relating
 * to a hardware implementation of the functionality of the software
 * licensed hereunder.  You may use the software subject to the license
 * terms below provided that you ensure that this notice is replicated
 * unmodified and in its entirety in all distributions of the software,
 * modified or unmodified, in source code or in binary form.
 *
 * Copyright (c) 2003-2006 The Regents of The University of Michigan
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Authors: Nathan Binkert
 *          Ali Saidi
 *          Chander Sudanthi
 */

#define m5_op 0xFF

#include "m5ops.h"

#define INST(op, ra, rb, func) \
        .long (((op) << 24) | ((func) << 16) | ((ra) << 12) | (0x1 << 8) | (0x1 << 4) | (rb))
/*               m5ops           m5func             ra         coproc 1       op=1       rb   */

#define LEAF(func)    \
        .globl  func; \
func:

#define RET           \
        RET

#define END(func)     \

#define SIMPLE_OP(_f, _o)       \
        LEAF(_f)                \
                _o;             \
                RET;            \
        END(_f)

#define ARM INST(m5_op, 0, 0, arm_func)
#define QUIESCE INST(m5_op, 0, 0, quiesce_func)
#define QUIESCENS INST(m5_op, 0, 0, quiescens_func)
#define QUIESCECYC INST(m5_op, 0, 0, quiescecycle_func)
#define QUIESCETIME INST(m5_op, 0, 0, quiescetime_func)
#define RPNS INST(m5_op, 0, 0, rpns_func)
#define WAKE_CPU INST(m5_op, 0, 0, wakecpu_func)
#define M5EXIT INST(m5_op, 0, 0, exit_func)
#define M5FAIL INST(m5_op, 0, 0, fail_func)
#define INITPARAM INST(m5_op, 0, 0, initparam_func)
#define LOADSYMBOL INST(m5_op, 0, 0, loadsymbol_func)
#define RESET_STATS INST(m5_op, 0, 0, resetstats_func)
#define DUMP_STATS INST(m5_op, 0, 0, dumpstats_func)
#define DUMPRST_STATS INST(m5_op, 0, 0, dumprststats_func)
#define CHECKPOINT INST(m5_op, 0, 0, ckpt_func)
#define READFILE INST(m5_op, 0, 0, readfile_func)
#define WRITEFILE INST(m5_op, 0, 0, writefile_func)
#define DEBUGBREAK INST(m5_op, 0, 0, debugbreak_func)
#define SWITCHCPU INST(m5_op, 0, 0, switchcpu_func)
#define ADDSYMBOL INST(m5_op, 0, 0, addsymbol_func)

.text

SIMPLE_OP(arm, ARM)
SIMPLE_OP(quiesce, QUIESCE)
SIMPLE_OP(quiesceNs, QUIESCENS)
SIMPLE_OP(quiesceCycle, QUIESCECYC)
SIMPLE_OP(quiesceTime, QUIESCETIME)
SIMPLE_OP(rpns, RPNS)
SIMPLE_OP(wakeCPU, WAKE_CPU)
SIMPLE_OP(m5_exit, M5EXIT)
SIMPLE_OP(m5_fail, M5FAIL)
SIMPLE_OP(m5_initparam, INITPARAM)
SIMPLE_OP(m5_loadsymbol, LOADSYMBOL)
SIMPLE_OP(m5_reset_stats, RESET_STATS)
SIMPLE_OP(m5_dump_stats, DUMP_STATS)
SIMPLE_OP(m5_dumpreset_stats, DUMPRST_STATS)
SIMPLE_OP(m5_checkpoint, CHECKPOINT)
SIMPLE_OP(m5_readfile, READFILE)
SIMPLE_OP(m5_writefile, WRITEFILE)
SIMPLE_OP(get_tid, INST(m5_op, 0, 0,get_tid_func))
SIMPLE_OP(m5_switchcpu, SWITCHCPU)
SIMPLE_OP(set_addr_bounds, INST(m5_op, 0, 0, set_addr_bounds_func))
SIMPLE_OP(set_function_pointer, INST(m5_op, 0, 0,set_function_pointer_func))
SIMPLE_OP(start_prefetchers, INST(m5_op, 0, 0,start_prefetchers_func))
SIMPLE_OP(get_state_data, INST(m5_op, 0, 0,get_state_data_func))
SIMPLE_OP(set_fetching, INST(m5_op, 0, 0,set_fetching_func))
SIMPLE_OP(add_special_target, INST(m5_op, 0, 0,add_special_target_func))
SIMPLE_OP(cont_or_susp, INST(m5_op, 0, 0,cont_or_susp_func))
SIMPLE_OP(get_ewma_ratios, INST(m5_op, 0, 0,get_ewma_ratios_func))
SIMPLE_OP(set_fetching_extra, INST(m5_op, 0, 0,set_fetching_extra_func))


