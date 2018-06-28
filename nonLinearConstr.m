function [c, ceq] = nonLinearConstr(q0dot, robot, Ve, J, Jc, q_old, Tnew)
    qdot = Jc*Ve + (eye(size(Jc*J))-Jc*J)*q0dot;
    q_new = q_old + qdot';
    % Nonlinear inequality constraints
    c = [];
    ceq = [];
    %VlimPris = 0.1;
    for i = 1:1:robot.n
        %constraints limits of joints for new q
        f = q_new(i) - robot.qlim(i,2);
        c = cat(1, c,f);
        f = -(q_new(i)) + robot.qlim(i,1);
        c = cat(1,c,f);
        % velocity limits
        if i==1
            f = abs(qdot(i)) - 0.05; % 5 cm for prismatic joint
        else
            f = abs(qdot(i)) - 0.25; % 15 gradi for rotational joints
        end
        c = cat(1,c,f);
    end
    thPos = 0.05;
    thAngle = 0.15;
    pReal = transl(robot.fkine(q_new));
    pDes = transl(Tnew);
    f = max(abs(pReal-pDes)) - thPos; %threshold error for position
    c = cat(1,c,f);
    f = max(max(abs(t2r(robot.fkine(q_new))- t2r(Tnew)))) - thAngle;
    c = cat(1,c,f);
end