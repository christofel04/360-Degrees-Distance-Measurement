theta = 0:(pi/180):pi;
s = serial('COM5');
s.BaudRate=9600
fopen(s)
i = 0;
add_error = 4 % Untuk kalibrasi error aditif
mul_error = 4.0438421 %1.5105 % Untuk kalibrasi error multiplikatif

inc = 1;

while i<180
   A = fgets(s);
   num(i+1) = str2num(A);
   num(i+1) = (num(i+1)-add_error)*mul_error
   i = i+1;
end
fclose(s)

j = 1

while j<181
    tab(j,1) = (j-1)*inc
    tab(j,2) = num(j)
    tab(j,3) = num(j)*cosd((j-1)*inc)
    tab(j,4) = num(j)*sind((j-1)*inc)
    j = j+1
end
%figure
%polar(theta,num)

plot(tab(:,3),tab(:,4))

sum(tab(:,2))/180