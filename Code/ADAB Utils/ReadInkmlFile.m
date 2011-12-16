function [ Strokes ] = ReadInkmlFile( InkmlFilePath )
%READINKMLFILE Reads the strokes from an XML inkml file and returns a cell
%array of the strokes.
%   [ StrokesCellArray ] = ReadInkmlFile('C:\OCRData\adab_database_v1.0\Data\set_1\inkml\1231874526312.inkml')

theStruct = ReadXML(InkmlFilePath);
Strokes= [];
for i=1:size(theStruct.Children,2)    
    child = theStruct.Children(i);
    if (strcmp(child.Name,'trace'))
        points = child.Children.Data;
        Strokes = [Strokes;{points}];
    end
end
end
