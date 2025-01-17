% Script file to show how to use the inverse dynamics simulator
%
% Author        : Jonathan EDEN
% Created       : 2015
% Description    :

% Load configs
clc; clear; warning off; close all;

% Set up the model 
model_config = ModelConfig('2 DoF VSD');
cable_set_id = 'basic'; % no "basic_vsd" already
modelObj = model_config.getModel(cable_set_id);

% Set up the workspace simulator
% First the grid
q_step          =   0.1; n_dim           =   2;
uGrid           =   UniformGrid(0.1*ones(n_dim,1),0.9*ones(n_dim,1),q_step*ones(n_dim,1),'step_size');
% Define the workspace condition and metrics
w_condition  =   {WrenchClosureCondition([])};
w_metrics = {SEACMetric(), TensionFactorMetric()};

% Start the simulation
disp('Start Setup Simulation');
wsim            =   PointWorkspaceSimulator(modelObj, uGrid, w_condition, w_metrics, []);

% Run the simulation
disp('Start Running Simulation');
wsim.run();

% Plot the simulation
disp('Start Plotting Simulation');
wsim.plotWorkspace2([],WorkspaceConditionType.WRENCH_CLOSURE,[1,2]);
