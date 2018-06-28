function [qtraj, traj, ee_traj] = trajConfigurationJoints(robot,qi,Ti,Tf,qf)  
    traj = ctraj(Ti, Tf, 20);
    dampingFactor = 0.03;
    qtraj = qi;
    ee_traj = Ti;
    for i = 2:1:size(traj,3)
        Told = ee_traj(:,:,end);
        Tnew = traj(:,:,i);
        qOld = qtraj(end,:);
        J = robot.jacob0(qOld); 
        Jc = J'*(J*J'+dampingFactor^2*eye(size(J*J')))^-1;
        Ve = tr2delta(Told, Tnew);
        q0dot = optDistance2ConfigJoints(robot, Ve, J, Jc, qOld, Tnew, qf);
        qDot = Jc*Ve + (eye(size(Jc*J))-Jc*J)*q0dot;
        qNew = qOld + qDot';
        qtraj=cat(1,qtraj,qNew);
        
        eeT = robot.fkine(qtraj(end,:));
        ee_traj= cat(3,ee_traj,eeT);

    end 

end