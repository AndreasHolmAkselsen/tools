%make avi movie

dir = 'C:\SLUGGIT_MATLAB\Georgeyboy\Wave\doc\images\simulations\m2_C_Ainv_K_characteristic_pm05deg_12_wave_2';
% dir = 'C:\SLUGGIT_MATLAB\Georgeyboy\Wave\image_dump\0_deg\cap_USG_10_USL_0p25_L_100d';
% dir = 'C:\Users\akselsen\Documents\FACE_London_2014\images\multiscale';
FrameRate = 20;
if dir(end)~='\', dir = [dir,'\'];end
% name = 'saveas_waves_n_';
name = 'clean_waves_n_';
% name = 'ms_';
extension = '.png';
no = 'all';
outupt_dir = dir;
output_name = 'movie4';
% codec = 'Motion JPEG AVI';
codec = 'MPEG-4';





if strcmp(no,'all')
   start = 1;
   i = 1;
   while exist(sprintf('%s%s%04.f%s',dir,name,i+1,extension),'file')
      i = i+1; 
   end
   no = start:i;
   if ~exist(sprintf('%s%s%04.f%s',dir,name,0,extension),'file'), no(1)=[];end
end


images = cell(length(no),1);
for i = 1:length(no)
    images{i} = sprintf('%s%s%04.f%s',dir,name,no(i),extension);
end


%% using movie2avi. 

% do_padding = false;
% do_from_fig = false;
% % 
% nFrames = length(images);
% clear mov
% mov(1:nFrames) = struct('cdata', [],...
%     'colormap', []);
% if do_from_fig
%     for i = 1:nFrames
%         h = open(images{i});
%         mov(i) = getframe(h);
%         close(h);
%     end
% else
%     if do_padding
%         ny = 2^10;
%         nx = 2^10;
%         im_padded = 255*ones(ny,nx,3,'uint8');
%         for i = 1:nFrames
%             im = imread(images{i});
%             [y,x,~] = size(im);
%             im_padded(1:y, 1:x, 1:3) = im;
%             mov(i) = im2frame(im_padded);
%         end
%     else
%         for i = 1:nFrames
%             im = imread(images{i});
%             if ndims(im) == 2
%                 mov(i) = im2frame(im, gray(256));
%             else
%                 mov(i) = im2frame(im);
%             end
%         end
%     end
% end
% 
% movie2avi(mov, [outupt_dir,output_name,'.avi'], 'compression', 'FFDS' ,'quality',100,'fps',FrameRate); 
% % movie2avi(mov, [outupt_dir,output_name,'.avi'], 'compression', 'none' ,'quality',25,'fps',FrameRate); 





nFrames = length(images);
vidObj = VideoWriter([outupt_dir,output_name],codec);
vidObj.FrameRate = FrameRate;
open(vidObj);
for i = 1:nFrames
    [im,cmap] = imread(images{i});
    if ndims(im) == 2
        mov_frame = im2frame(im, gray(256));
    else
        mov_frame = im2frame(im,cmap);
    end
    writeVideo(vidObj,mov_frame);
end
close(vidObj);


