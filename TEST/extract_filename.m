% Enter your destination folder, and just run
% You can also modify the name of output file in line 5
cd D:\Navlab\rollingShutter\data\images;
files = dir( '*.png' );
 fileID = fopen('e3.txt','w');
for i=1:numel(files)
 
  [~,name,~]=fileparts(files(i).name);
  %name=str2num(name);
  fprintf(fileID,'%s\n',name);
end
fclose(fileID);
