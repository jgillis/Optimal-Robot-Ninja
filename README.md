# Optimal robot ninja

This repository contains the matlab and python code written for the master thesis 'Optimal robot ninja: making robots move in an optimal and responsive way'.
The goal of this thesis is to make a robot platform (in this a turtlebot) move optimally in an environment containing static (and optionally also dynamic) obstacles. Optimality is defined her with respect to time.
The project is a collaboration between Intermodalics and the MECO research group at the KU Leuven.

## Repo structure
The repository contains following folders:
 - __/matlab__: initial matlab code and simulation environment.
 - __/python__: python implementation of the matlab code, wit an architecture that fits the ROS environment used at Intermodalics, more specifically the move-base-flex package.

Below is a figure of the code architecture:

![alt text](https://github.com/Michael-Purser/Optimal-Robot-Ninja/blob/master/architecture.png "Code architecture")

