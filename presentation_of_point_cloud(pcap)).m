veloReader = velodyneFileReader('4 intersecton w police car.pcap','HDL32E');
xlimits = [-60 60];
ylimits = [-60 60];
zlimits = [-20 20];
player = pcplayer(xlimits,ylimits,zlimits);
xlabel(player.Axes,'X (m)');
ylabel(player.Axes,'Y (m)');
zlabel(player.Axes,'Z (m)');
while true
    veloReader.CurrentTime = veloReader.StartTime + seconds(0.3); 
    while(hasFrame(veloReader) && player.isOpen() && (veloReader.CurrentTime < veloReader.StartTime + seconds(500)))
        ptCloudObj = readFrame(veloReader);
        view(player,ptCloudObj.Location,ptCloudObj.Intensity);
        pause(0.05);
    end
end
