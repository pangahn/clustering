function confusion_chart(actual,detected)

if length(actual) ~= length(detected)
    error('The length of actual and detected must be same!')
end
C = confusionmat(actual, detected);
m = size(C, 1);
figure
imagesc(C);
colormap(flipud(gray));
colorbar
xticks(unique(actual))
yticks(unique(detected))
xlabel('Actual')
ylabel('Detected')

title('Confusion Matrix of Recognition');
textStrings = num2str(C(:),'%d');
textStrings = strtrim(cellstr(textStrings));
  
[x,y] = meshgrid(1:m);
hStrings = text(x(:),y(:),textStrings(:),...
                'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));
textColors = repmat(C(:) > midValue,1,3);

set(hStrings,{'Color'},num2cell(textColors,2));
end
