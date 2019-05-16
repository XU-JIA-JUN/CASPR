% Script file for generating the interference free workspace (point-based)
%
% Author        : Autogenerate
% Created       : 20XX
% Description    :

% Load configs
clc; clear; warning off; close all;

% Set up the model 
% model_config    =   ModelConfig('Example planar XY');
% cable_set_id    =   'basic';
model_config    =   ModelConfig('The Cable Robot Simulator');
cable_set_id    =   'original';
modelObj        =   model_config.getModel(cable_set_id);

q_begin         =   modelObj.bodyModel.q_min; q_end = modelObj.bodyModel.q_max;
q_step          =   (modelObj.bodyModel.q_max - modelObj.bodyModel.q_min)/5;

% Set up the workspace simulator
% Defne the grid
uGrid           =   UniformGrid(q_begin, q_end, q_step,'step_size');
% Minimum distance for interference free
min_epsilon_d   = 0.01;
% Define the workspace condition(s): must have at least 1 condition
w_conditions    =   {WrenchClosureCondition([]),WorkspaceStaticCondition([]),InterferenceFreeCondition([], min_epsilon_d)};
% Define the workspace metric(s) (optional)
w_metrics       =   {TensionFactorMetric,ConditionNumberMetric};
% Define the connectivity condition for point-wise workspaces
w_connectivity  =   WorkspaceConnectivityBase.CreateWorkspaceConnectivityCondition(WorkspaceConnectivityType.GRID,uGrid);

% Start the simulation
CASPR_log.Info('Start Setup Simulation');
wsim            =   PointWorkspaceSimulator(modelObj, uGrid, w_conditions, w_metrics, w_connectivity);

% Run the simulation
CASPR_log.Info('Start Running Simulation');
wsim.run();

% Plot the simulation, accept single/multiple conditions/metrics input
CASPR_log.Info('Start Plotting Simulation');

graph_plot = wsim.workspace.plotGraph(w_conditions,w_metrics,w_connectivity);
close all force
% 2D/3D
plot_axis = [1 2 3];% Maximum allow 3 axis plot e.g. here 1st, 2nd variables as the axis
sliding_axis = [4];% Slider axis maximum 1 input so far
% Fixed variables, you can leave the value of plot axis zero/any number, it won't affect the result plot
% 4 digits numbers are counted into the plotting error
fixed_variables = [4.80000000000000,3,4,0.628320000000000,-3.14160000000000,-3.14160000000000]; 
cartesian_workspace_graph = wsim.workspace.plotWorkspaceSlider(plot_axis,sliding_axis,w_conditions, w_metrics, fixed_variables);
