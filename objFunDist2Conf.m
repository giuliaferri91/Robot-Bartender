function val = objFunDist2Conf(q0dot, q_old, Ve, J, Jc, qf)
    qdot = Jc*Ve + (eye(size(Jc*J))-Jc*J)*q0dot;
    q_new = q_old + qdot'; % new q in function of q0dot 
    val = norm(qf-q_new); 
end