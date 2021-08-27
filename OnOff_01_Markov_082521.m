clearvars;
close all;

% Represents a simple 2 step Markov Chain (states 0-off and 1-on).

State = 0;  %initial state of machine

P_01 = 0.9; %probability of state 0 going to state 1
P_00 = 1-P_01;  %probability of state 0 staying in state 0

P_10 = 0.3; %probability of state 1 going to state 0
P_11 = 1-P_10;  %probability of state 1 staying in state 1

Events = 100;  %number of events that occur

Color = zeros(Events,3);    %memory allocation for color of squares
Step = zeros(1,Events);
Log = zeros(1,Events+1);
Log(1) = State;   %log of history of states

for i = 1:Events
    Step(i) = i;
    j = rand;   %random number to decide what occurs in step
    
    if State == 0
        if j <= P_01  %if j is less than probability of state swapping...
            State = 1;  %...then switch states of machine
        end
    else
        if j <= P_10  %if j is less than probability of state swapping...
            State = 0;  %...then switch states of machine
        end
    end
    Log(i+1) = State;
    if State == 1   %if machine is turned on...
        Color(i+1,:) = [1 0 0]; %...square is red
    else
        Color(i+1,:) = [0 0 1];
    end
end

figure(1);
for k = 1:Events
    rectangle('Position',[(k-1) 0 1 1],'FaceColor',[Color(k+1,1) Color(k+1,2) Color(k+1,3)],'EdgeColor',[1 1 1]);
end
title('Red = On : Blue = Off');