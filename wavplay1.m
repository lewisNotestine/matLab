

fid = fopen('book1.prn')
fgetl(fid)

fid = fopen(book1.prn)
fid=fopen('fgetl.m');
while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    disp(tline)
end
fclose(fid);