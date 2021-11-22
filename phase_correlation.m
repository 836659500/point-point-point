fixed = ptCloudA;
moving = ptCloudB;
maxDistance = 0.4;
referenceVector = [0 0 1];
groundMoving = pcfitplane(moving,maxDistance,referenceVector);
groundFixed = pcfitplane(fixed,maxDistance,referenceVector);
tformMoving = normalRotation(groundMoving,referenceVector);
tformFixed = normalRotation(groundFixed,referenceVector);
movingCorrected = pctransform(moving,tformMoving);
fixedCorrected = pctransform(fixed,tformFixed);
gridSize = 100;
gridStep = 0.5;
tform = pcregistercorr(movingCorrected,fixedCorrected,gridSize,gridStep);
combinedTform = rigid3d(tform.T * tformMoving.T * tformFixed.T);
movingReg = pctransform(moving,combinedTform);
figure
subplot(121)
pcshowpair(moving,fixed)
title('Before Registration')
view(2)
subplot(122)
pcshowpair(movingReg,fixed)
title('After Registration')
view(2)
