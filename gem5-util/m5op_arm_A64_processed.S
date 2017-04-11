# 48 "gem5-util/m5op_arm_A64.S" 2
# 89 "gem5-util/m5op_arm_A64.S"
.text

.globl arm; arm: .long (((0xFF) << 24) | ((arm_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl quiesce; quiesce: .long (((0xFF) << 24) | ((quiesce_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl quiesceNs; quiesceNs: .long (((0xFF) << 24) | ((quiescens_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl quiesceCycle; quiesceCycle: .long (((0xFF) << 24) | ((quiescecycle_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl quiesceTime; quiesceTime: .long (((0xFF) << 24) | ((quiescetime_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl rpns; rpns: .long (((0xFF) << 24) | ((rpns_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl wakeCPU; wakeCPU: .long (((0xFF) << 24) | ((wakecpu_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_exit; m5_exit: .long (((0xFF) << 24) | ((exit_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_fail; m5_fail: .long (((0xFF) << 24) | ((fail_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_initparam; m5_initparam: .long (((0xFF) << 24) | ((initparam_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_loadsymbol; m5_loadsymbol: .long (((0xFF) << 24) | ((loadsymbol_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_reset_stats; m5_reset_stats: .long (((0xFF) << 24) | ((resetstats_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_dump_stats; m5_dump_stats: .long (((0xFF) << 24) | ((dumpstats_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_dumpreset_stats; m5_dumpreset_stats: .long (((0xFF) << 24) | ((dumprststats_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_checkpoint; m5_checkpoint: .long (((0xFF) << 24) | ((ckpt_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_readfile; m5_readfile: .long (((0xFF) << 24) | ((readfile_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_writefile; m5_writefile: .long (((0xFF) << 24) | ((writefile_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl get_tid; get_tid: .long (((0xFF) << 24) | ((get_tid_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl m5_switchcpu; m5_switchcpu: .long (((0xFF) << 24) | ((switchcpu_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl set_addr_bounds; set_addr_bounds: .long (((0xFF) << 24) | ((set_addr_bounds_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl set_function_pointer; set_function_pointer: .long (((0xFF) << 24) | ((set_function_pointer_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl start_prefetchers; start_prefetchers: .long (((0xFF) << 24) | ((start_prefetchers_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl get_state_data; get_state_data: .long (((0xFF) << 24) | ((get_state_data_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl set_fetching; set_fetching: .long (((0xFF) << 24) | ((set_fetching_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl add_special_target; add_special_target: .long (((0xFF) << 24) | ((add_special_target_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl cont_or_susp; cont_or_susp: .long (((0xFF) << 24) | ((cont_or_susp_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl get_ewma_ratios; get_ewma_ratios: .long (((0xFF) << 24) | ((get_ewma_ratios_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
.globl set_fetching_extra; set_fetching_extra: .long (((0xFF) << 24) | ((set_fetching_extra_func) << 16) | ((0) << 12) | (0x1 << 8) | (0x1 << 4) | (0)); RET;
