function Euclidean_Distance = ComputeEuclidean_Distance(reference,estimate)

    Euclidean_Distance = sqrt((reference(1,1,1) - estimate(1,1,1)).^2 + (reference(1,1,2) - estimate(1,1,2)).^2 + (reference(1,1,3) - estimate(1,1,3)).^2);

end