function []=write()
% Writing hardcode initals of Yao Xinjie 
%written by Xinjie Yao
step=5;
Z=[(90:-step:60), (60:step:90), (90:-step:60), (60:-step:30)...
    (30:step:90) (90:-step:30)];
Y=[(30:step:60),(60:step:90) ,(90:-step:60), 60*ones(1,length((60:-step:30)))...
    (100:step:160) (100:step:160)];
X=50*ones(1,length(Z));
for i=1:length(Z)
    if i~=1
        delete(joint_plot);
    end 
    [angle,pos,joint_plot]=ik([X(i),Y(i), Z(i)],false);
    
    if i ~=1 && i~=(30/step+1)*4+1 && i~= (30/step+1)*4+(60/step+1)+1
        line([pos_last(1) pos(1)],[pos_last(2) pos(2)],[pos_last(3) pos(3)],'Color', 'r');
    end

    pause(.001)
    pos_last=pos;
end 