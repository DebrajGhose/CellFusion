%let's see when the red and green peaks merge

close all

clear all


for pairs = 3
    
    for time = 1:30
        
        
        if exist( [  'Values_488_pr', num2str(pairs) ,'_t',  sprintf('%02d',time) ,'.csv'  ] )
            
            A = readtable( [  'Values_488_pr', num2str(pairs) ,'_t',  sprintf('%02d',time) ,'.csv'  ] );
            A = table2array(A);
            
            B = readtable( [  'Values_561_pr', num2str(pairs) ,'_', sprintf('%02d',time) ,'.csv'  ] );
            B = table2array(B);
            
            %normalize
            
            A(:,2) = ( A(:,2) - min(A(:,2)))/max( A(:,2) - min(A(:,2)));
            
            B(:,2) = ( B(:,2) - min(B(:,2)))/max( B(:,2) - min(B(:,2)));
            
            plot(A(:,1),A(:,2) , 'g'  )
            hold on
            plot(B(:,1),B(:,2),'r')
            hold off
            
            
            
            intproduct = sum( A(:,2) .*B(:,2)  );
            
            [maxA , ImaxA ] = max(A(:,2)); [maxB , ImaxB ] = max(B(:,2));
            
            maxdistance = abs(ImaxA - ImaxB);
            
            text(0.7,0.9, ['Pair ' , num2str(pairs) ],'Units','Normalized')
            text(0.7,0.8, ['Timepoint ' , num2str(time) ],'Units','Normalized')
            text(0.7,0.7, ['Integral product ' , num2str(intproduct) ],'Units','Normalized')
            text(0.7,0.6, ['Max distance ' , num2str(maxdistance) ],'Units','Normalized')
            
            Frame = getframe(gcf);
            
            drawnow
            
            
            if pairs == 1 && time == 1
                
                imwrite(Frame.cdata,'pair3.tif')
                
            else
                
                imwrite(Frame.cdata,'pair3.tif','WriteMode','append')
                
            end
            
            
        end
        
    end
    
end