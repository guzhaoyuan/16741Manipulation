clear;
bars = 100;
angle_list = zeros(1,bars);
sum = 0;
num = 0;
for i = 1:1000000
    q_rand = rand(1,4)*2-1;
    if norm(q_rand) <= 1
        q = q_rand / norm(q_rand);
        angle = acos(q(1))*2;
        if angle < 0
            angle = angle + pi;
        end
        if angle > pi
            angle = angle - pi;
        end
        angle_list(floor(angle/pi*bars)+1) = angle_list(floor(angle/pi*bars)+1) + 1;
        sum = sum + angle;
        num = num + 1;
    end
end
bar([1:bars]/bars*pi,angle_list);
title('Number of Angles for each angle range');
xlabel('Angle range(rad)');
ylabel('Number of angles');
sum/num
