%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'CKmcmc';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'e1'};
M_.exo_names_tex(1) = {'e1'};
M_.exo_names_long(1) = {'e1'};
M_.exo_names(2) = {'e2'};
M_.exo_names_tex(2) = {'e2'};
M_.exo_names_long(2) = {'e2'};
M_.endo_names = cell(11,1);
M_.endo_names_tex = cell(11,1);
M_.endo_names_long = cell(11,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'k'};
M_.endo_names_long(3) = {'k'};
M_.endo_names(4) = {'n'};
M_.endo_names_tex(4) = {'n'};
M_.endo_names_long(4) = {'n'};
M_.endo_names(5) = {'invest'};
M_.endo_names_tex(5) = {'invest'};
M_.endo_names_long(5) = {'invest'};
M_.endo_names(6) = {'z1'};
M_.endo_names_tex(6) = {'z1'};
M_.endo_names_long(6) = {'z1'};
M_.endo_names(7) = {'z2'};
M_.endo_names_tex(7) = {'z2'};
M_.endo_names_long(7) = {'z2'};
M_.endo_names(8) = {'MUC'};
M_.endo_names_tex(8) = {'MUC'};
M_.endo_names_long(8) = {'MUC'};
M_.endo_names(9) = {'MUL'};
M_.endo_names_tex(9) = {'MUL'};
M_.endo_names_long(9) = {'MUL'};
M_.endo_names(10) = {'r'};
M_.endo_names_tex(10) = {'r'};
M_.endo_names_long(10) = {'r'};
M_.endo_names(11) = {'w'};
M_.endo_names_tex(11) = {'w'};
M_.endo_names_long(11) = {'w'};
M_.endo_partitions = struct();
M_.param_names = cell(15,1);
M_.param_names_tex = cell(15,1);
M_.param_names_long = cell(15,1);
M_.param_names(1) = {'alppha'};
M_.param_names_tex(1) = {'alppha'};
M_.param_names_long(1) = {'alppha'};
M_.param_names(2) = {'betta'};
M_.param_names_tex(2) = {'betta'};
M_.param_names_long(2) = {'betta'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'gam'};
M_.param_names_tex(4) = {'gam'};
M_.param_names_long(4) = {'gam'};
M_.param_names(5) = {'nss'};
M_.param_names_tex(5) = {'nss'};
M_.param_names_long(5) = {'nss'};
M_.param_names(6) = {'rho1'};
M_.param_names_tex(6) = {'rho1'};
M_.param_names_long(6) = {'rho1'};
M_.param_names(7) = {'sigma1'};
M_.param_names_tex(7) = {'sigma1'};
M_.param_names_long(7) = {'sigma1'};
M_.param_names(8) = {'rho2'};
M_.param_names_tex(8) = {'rho2'};
M_.param_names_long(8) = {'rho2'};
M_.param_names(9) = {'sigma2'};
M_.param_names_tex(9) = {'sigma2'};
M_.param_names_long(9) = {'sigma2'};
M_.param_names(10) = {'psi'};
M_.param_names_tex(10) = {'psi'};
M_.param_names_long(10) = {'psi'};
M_.param_names(11) = {'c1'};
M_.param_names_tex(11) = {'c1'};
M_.param_names_long(11) = {'c1'};
M_.param_names(12) = {'iss'};
M_.param_names_tex(12) = {'iss'};
M_.param_names_long(12) = {'iss'};
M_.param_names(13) = {'yss'};
M_.param_names_tex(13) = {'yss'};
M_.param_names_long(13) = {'yss'};
M_.param_names(14) = {'kss'};
M_.param_names_tex(14) = {'kss'};
M_.param_names_long(14) = {'kss'};
M_.param_names(15) = {'css'};
M_.param_names_tex(15) = {'css'};
M_.param_names_long(15) = {'css'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 11;
M_.param_nbr = 15;
M_.orig_endo_nbr = 11;
M_.aux_vars = [];
options_.varobs = cell(2, 1);
options_.varobs(1)  = {'c'};
options_.varobs(2)  = {'n'};
options_.varobs_id = [ 2 4  ];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.eq_nbr = 11;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 4 0;
 0 5 0;
 1 6 0;
 0 7 0;
 0 8 0;
 2 9 0;
 3 10 0;
 0 11 15;
 0 12 0;
 0 13 16;
 0 14 0;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [4; 2; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'MUC' ;
  2 , 'name' , 'MUL' ;
  3 , 'name' , 'r' ;
  4 , 'name' , 'w' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , 'z1' ;
  8 , 'name' , 'z2' ;
  9 , 'name' , 'y' ;
  10 , 'name' , 'invest' ;
  11 , 'name' , 'k' ;
};
M_.mapping.y.eqidx = [9 10 ];
M_.mapping.c.eqidx = [1 10 ];
M_.mapping.k.eqidx = [3 4 9 11 ];
M_.mapping.n.eqidx = [3 4 9 ];
M_.mapping.invest.eqidx = [10 11 ];
M_.mapping.z1.eqidx = [3 4 7 9 ];
M_.mapping.z2.eqidx = [2 8 ];
M_.mapping.MUC.eqidx = [1 5 6 ];
M_.mapping.MUL.eqidx = [2 6 ];
M_.mapping.r.eqidx = [3 5 ];
M_.mapping.w.eqidx = [4 6 ];
M_.mapping.e1.eqidx = [7 ];
M_.mapping.e2.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 3;
M_.block_structure.block(1).mfs = 3;
M_.block_structure.block(1).equation = [ 7 8 2];
M_.block_structure.block(1).variable = [ 6 7 9];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 6;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 4 5 6 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 8;
M_.block_structure.block(2).mfs = 7;
M_.block_structure.block(2).equation = [ 10 4 6 1 9 11 5 3];
M_.block_structure.block(2).variable = [ 5 4 11 2 1 3 8 10];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 21;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [5 0 8 9 10 11 12 13 14 20 21 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 4 5 7 1 4 7 1 2 3 5 4 5 5 2 3 6 7 6 6 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([5 5 5 5 8 8 8 9 9 10 10 11 11 12 13 13 13 14 20 21 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 1 5 5 5 8 10 12 14 15 18 19 19 19 19 19 19 20 21 ]);
M_.block_structure.variable_reordered = [ 6 7 9 5 4 11 2 1 3 8 10];
M_.block_structure.equation_reordered = [ 7 8 2 10 4 6 1 9 11 5 3];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 3 3;
 4 3;
 7 6;
 8 7;
 9 3;
 11 3;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 2;
 1 8;
 2 7;
 2 9;
 3 4;
 3 6;
 3 10;
 4 4;
 4 6;
 4 11;
 5 8;
 6 8;
 6 9;
 6 11;
 7 6;
 8 7;
 9 1;
 9 4;
 9 6;
 10 1;
 10 2;
 10 5;
 11 3;
 11 5;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 5 8;
 5 10;
];
M_.block_structure.dyn_tmp_nbr = 8;
M_.state_var = [6 7 3 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(15, 1);
M_.endo_trends = struct('deflator', cell(11, 1), 'log_deflator', cell(11, 1), 'growth_factor', cell(11, 1), 'log_growth_factor', cell(11, 1));
M_.NNZDerivatives = [34; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([3 4 9 11 7 8 9 10 1 10 11 3 4 9 10 11 3 4 7 9 2 8 1 5 6 2 6 3 4 6 5 5 7 8 ]);
M_.dynamic_g1_sparse_colval = int32([3 3 3 3 6 7 12 12 13 13 14 15 15 15 16 16 17 17 17 17 18 18 19 19 19 20 20 21 22 22 30 32 34 35 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 5 5 5 6 7 7 7 7 7 9 11 12 15 17 21 23 26 28 29 31 31 31 31 31 31 31 31 32 32 33 33 34 35 ]);
M_.lhs = {
'MUC'; 
'MUL'; 
'r'; 
'w'; 
'MUC'; 
'MUL/MUC'; 
'z1'; 
'z2'; 
'y'; 
'invest'; 
'k'; 
};
M_.static_tmp_nbr = [4; 2; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 7];
M_.block_structure_stat.block(1).variable = [ 6];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 8];
M_.block_structure_stat.block(2).variable = [ 7];
M_.block_structure_stat.block(3).Simulation_Type = 1;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 2];
M_.block_structure_stat.block(3).variable = [ 9];
M_.block_structure_stat.block(4).Simulation_Type = 6;
M_.block_structure_stat.block(4).endo_nbr = 8;
M_.block_structure_stat.block(4).mfs = 8;
M_.block_structure_stat.block(4).equation = [ 4 5 6 1 3 9 10 11];
M_.block_structure_stat.block(4).variable = [ 3 8 11 2 10 4 1 5];
M_.block_structure_stat.variable_reordered = [ 6 7 9 3 8 11 2 10 4 1 5];
M_.block_structure_stat.equation_reordered = [ 7 8 2 4 5 6 1 3 9 10 11];
M_.block_structure_stat.incidence.sparse_IM = [
 1 2;
 1 8;
 2 7;
 2 9;
 3 3;
 3 4;
 3 6;
 3 10;
 4 3;
 4 4;
 4 6;
 4 11;
 5 8;
 5 10;
 6 8;
 6 9;
 6 11;
 7 6;
 8 7;
 9 1;
 9 3;
 9 4;
 9 6;
 10 1;
 10 2;
 10 5;
 11 3;
 11 5;
];
M_.block_structure_stat.tmp_nbr = 7;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 5 6 8 2 3 4 1 3 4 7 2 5 1 5 6 6 7 7 8 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 1 1 1 2 2 2 3 3 4 4 5 5 6 6 6 7 7 8 8 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 5 8 10 12 14 17 19 21 ]);
M_.static_g1_sparse_rowval = int32([9 10 1 10 3 4 9 11 3 4 9 10 11 3 4 7 9 2 8 1 5 6 2 6 3 5 4 6 ]);
M_.static_g1_sparse_colval = int32([1 1 2 2 3 3 3 3 4 4 4 5 5 6 6 6 6 7 7 8 8 8 9 9 10 10 11 11 ]);
M_.static_g1_sparse_colptr = int32([1 3 5 9 12 14 18 20 23 25 27 29 ]);
close all;
set_param_value('alppha',0.33)
set_param_value('betta', 0.99)
set_param_value('delta',0.025)
set_param_value('gam', 2.0)
set_param_value('rho1', 0.9)
set_param_value('sigma1', 0.02)
set_param_value('rho2', 0.7)
set_param_value('sigma2', 0.01)
set_param_value('nss', 1/3)
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 1;
if isempty(estim_params_)
    estim_params_.var_exo = zeros(0, 10);
    estim_params_.var_endo = zeros(0, 10);
    estim_params_.corrx = zeros(0, 11);
    estim_params_.corrn = zeros(0, 11);
    estim_params_.param_vals = zeros(0, 10);
end
if ~isempty(find(estim_params_.param_vals(:,1)==2))
    error('Parameter betta has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 5, NaN, NaN, 0.95, 0.9999, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==4))
    error('Parameter gam has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 5.0, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==6))
    error('Parameter rho1 has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 1.0, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==7))
    error('Parameter sigma1 has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 7, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 0.1, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==8))
    error('Parameter rho2 has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 8, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 1.0, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==9))
    error('Parameter sigma2 has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 9, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 0.1, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==5))
    error('Parameter nss has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 5, NaN, NaN, 0.25, 0.375, NaN ];
options_.datafile = 'dsgedata';
options_.irf = 40;
options_.mh_init_scale = 5;
options_.mh_jscale = 0.8;
options_.mh_nblck = 1;
options_.mh_replic = 10000;
options_.nobs = 160;
options_.order = 1;
var_list_ = {};
oo_recursive_=dynare_estimation(var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'CKmcmc_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'CKmcmc_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'CKmcmc_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'CKmcmc_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'CKmcmc_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'CKmcmc_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'CKmcmc_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'CKmcmc_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
