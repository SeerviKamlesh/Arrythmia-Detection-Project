function [newVectors, whiteningMatrix, dewhiteningMatrix] = scraml(vectors, E, D, ~)
whiteningMatrix = inv (sqrt (D)) * E';
dewhiteningMatrix = E * sqrt (D);     
newVectors =  whiteningMatrix * vectors;