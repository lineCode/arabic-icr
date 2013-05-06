function  FixedSamplesCount= FixLettersSamples( LettersFolder )
%FIXLETTERSSAMPLES Summary of this function goes here
%   FixLettersSamples( 'C:\Users\kour\Desktop\letters')
% Rename the files.
% delete all image file and create new one.
% remove Inf points from the sample
% Print statistics of the sampleset

count = 0;
ax = axes();
sampleNum = 0;
LettersFolderList = dir(LettersFolder);
for i = 3:length(LettersFolderList)
    current_object = LettersFolderList(i);
    IsFile=~[current_object.isdir];
    FileName = current_object.name;
    FileNameSize = size(FileName);
    LastCharacter = FileNameSize(2);
    if (IsFile==1 && FileName(LastCharacter)=='m')        
        seqFileName = [LettersFolder,'\',FileName];
        sequence = dlmread(seqFileName);
        delete(seqFileName);
        [~,indx]=ismember(sequence,[Inf,-Inf],'rows');
        InfIndexes = find(indx,1);
        if (sum(indx)==1 && InfIndexes<=0.5*size(sequence,1))
            newSequence = sequence(InfIndexes+1:end,:);
            count=count+1;
        elseif (sum(indx)==1 && InfIndexes>0.5*size(sequence,1))
            count=count+1;
            continue;
        elseif (sum(indx)>1 || size(sequence,1)<3)
            count=count+1;
            continue;
        else 
            newSequence = sequence;
        end
        sampleNum=sampleNum+1;
        sampleName = [LettersFolder,'\sample',num2str(sampleNum)];
        sequenceFileName = [sampleName,'.m'];
        imageFileName = [sampleName,'.jpg'];
        dlmwrite(sequenceFileName,newSequence);
        plot (ax, newSequence(:,1),newSequence(:,2),'LineWidth',3);
        saveas(ax,imageFileName,'jpg');
    end
    if (IsFile==0 && isempty(findstr('svn', FileName)))
        folderName = [LettersFolder,'\',FileName];
        delete([folderName,'\*.jpg']);
        % Retrieve the name of the files only
        names = dir(folderName);
        names = {names(~[names.isdir]).name};
        
        % Rename in a LOOP
        for n = 1:numel(names)
            oldname = [folderName '\' names{n}];
            newname = [folderName '\old' names{n}];
            movefile(oldname,newname);
        end
        
        InnerCount = FixLettersSamples( [LettersFolder,'\',FileName] );
        count=count + InnerCount;
    end
end
FixedSamplesCount = count;