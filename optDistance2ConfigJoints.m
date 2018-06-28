function [q0dot_optimum] = optDistance2ConfigJoints(robot, Ve, J, Jc, q_old, Tnew, qf)  
    x0 = zeros(robot.n, 1);
    options = optimoptions('fmincon','Algorithm', 'active-set','MaxFunctionEvaluation',8000);
    q0dot_optimum = fmincon(@(q0dot)objFunDist2Conf(q0dot,q_old, Ve, J, Jc, qf),...
        x0,[],[],[],[],[],[],@(q0dot)nonLinearConstr(q0dot, robot, Ve, J, Jc, q_old, Tnew), options);
end