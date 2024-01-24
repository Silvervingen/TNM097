function Euclidean_Distance = ComputeEuclidean_Distance(reference,estimate)
%XYZ2CIELAB Summary of this function goes here
%   Detailed explanation goes here

[L,A,B] = xyz2lab(reference(1,:), reference(2,:), reference(3,:));
[L2,A2,B2] = xyz2lab(estimate(1,:), estimate(2,:), estimate(3,:));

Euclidean_Distance = sqrt((L - L2).^2 + (A - A2).^2 + (B - B2).^2);

end