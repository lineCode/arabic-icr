function [ num_removed_letters , output_word ] = SimplifyWord( input_word )
%UNTITLED Summary of this function goes here
%   [num_removed_letters , output_word ] = SimplifyWord( '&#x62c;&#x648;&#x631;&#x62c;')

num_removed_letters = 0;
parts = regexp(input_word,';','split');
output_word = simplifyletter (parts(1));
for i=2:size(parts,2)-1
    simplifiedLetter = simplifyletter (parts(i));
    if (strcmp(simplifiedLetter,''))
        num_removed_letters= num_removed_letters+1;
    else
    output_word = [output_word,';',simplifiedLetter];
    end
end
end

function output_letter = simplifyletter (input_letter)
input_letter = input_letter{1};
switch input_letter
    %A
    case '&#x622'
        output_letter = '&#x627';
    case '&#x623'
        output_letter = '&#x627';
    case '&#x625'
        output_letter = '&#x627';
    case '&#x627'
        output_letter = '&#x627';
    case '&#x671'
        output_letter = '&#x627';
        return
    %B
    case '&#x628'
        output_letter = '&#x628';
    case '&#x62a'
        output_letter = '&#x628';
    case '&#x62b'
        output_letter = '&#x628';
        return
    %7
    case '&#x62d'
        output_letter = '&#x62d';
    case '&#x62c'
        output_letter = '&#x62d';
    case '&#x62e'
        output_letter = '&#x62d';
        return
    %D
    case '&#x62f'
        output_letter = '&#x62f';
    case '&#x630'
        output_letter = '&#x62f';
        return
    %R
    case '&#x631'
        output_letter = '&#x631';
    case '&#x632'
        output_letter = '&#x631';
        return
    %S     
    case '&#x633'
        output_letter = '&#x633';
    case '&#x634'
        output_letter = '&#x633';
        return
    %8     
    case '&#x635'
        output_letter = '&#x635';
    case '&#x636'
        output_letter = '&#x635';
        return
    %6
    case '&#x637'
        output_letter = '&#x637';
    case '&#x638'
        output_letter = '&#x638';
        return   
    %3
    case '&#x639'
        output_letter = '&#x639';
    case '&#x63a'
        output_letter = '&#x639';
        return  
    %F
    case '&#x641'
        output_letter = '&#x641';
    case '&#x642'
        output_letter = '&#x641';
        return  
    %L
    case '&#x644'
        output_letter = '&#x644';
        return
    %K
    case '&#x643'
        output_letter = '&#x643';
        return
    %M
    case '&#x645'
        output_letter = '&#x645';
        return
    %N
    case '&#x646'
        output_letter = '&#x646';
        return
    %W
    case '&#x648'
        output_letter = '&#x648';
    case '&#x624'
        output_letter = '&#x648';
        return
    %Y
    case '&#x64a'
        output_letter = '&#x64a';
    case '&#x649'
        output_letter = '&#x64a';
    case '&#x626'
        output_letter = '&#x64a';
        return
    %H
    case '&#x647'
        output_letter = '&#x647';
    case '&#x629'
        output_letter = '&#x647';
        return
       
    otherwise
        output_letter = '';
        return;
        
end
end