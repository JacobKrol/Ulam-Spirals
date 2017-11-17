% Jacob Krol
% Creation of prime spirals / Ulam Spirals
clc

% Input of max value
r=true; % r = "repeat"
while(r==true)
    max=input('Enter the maximum value to test:');
    max=floor(max); %round down
    disp(' ')
    if(max<=0)
        disp('The entered value is invalid. Please try again.')
    else
        r=false;
        disp('Calculating...')
    end
    disp(' ')
end

% Create the grid
side=ceil(sqrt(max)); %take the square root, round up
if(mod(side,2)==0) %if it's even, add one
    side=side+1;
end
grid=zeros(side+1);

% Center the starting point
posx=ceil(side/2);
posy=posx;
direction=1;

% Fill the spiral
count=1;

while(count<max)
    %add the value
    p=true;
    if(mod(count,2)==0 || count==1)
        p=false;
    else
        for test = 3:2:count-1
            if(mod(count,test)==0)
                p=false;
                break
            end
        end
    end
    grid(posy,posx)=p+1;
    turn=false;
    switch direction %change position correct amount & check corner
        case 1
            posx=posx+1;
            if(grid(posy+1,posx)==0)
               turn=true;
            end
        case 2
            posy=posy+1;
            if(grid(posy,posx-1)==0)
               turn=true;
            end
        case 3
            posx=posx-1;
            if(grid(posy-1,posx)==0)
               turn=true;
            end
        case 4
            posy=posy-1;
            if(grid(posy,posx+1)==0)
               turn=true;
            end
    end
    if(turn==true) %turn corner if needed
        direction=direction+1;
    end
    if(direction==5) %loop direction values above 4
        direction=1;
    end
    count=count+1; %next value
end
if(count==max)
    p=true;
    if(mod(count,2)==0)
        p=false;
    else
        for test = 3:2:count-1
            if(mod(count,test)==0)
                p=false;
                break
            end
        end
    end
    grid(posy,posx)=p+1; %add the value
end
disp('Completed')

mycolor=ones(3,3);
mycolor(3,:)=[0.2 0.2 1];
colormap(mycolor)
pcolor(grid)
shading flat