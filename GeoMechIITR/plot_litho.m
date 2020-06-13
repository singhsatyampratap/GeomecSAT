% stratigraphy plot
function plot_litho(log)
    
    
    if isfield(log,"litho")==0
        log=load_lithology(log);
    end
    
    k=[0,1,1,0];
    a=[];
    l=length(log.litho);
    for i=1:l
        a=[a, log.litho(i,3)];
    end
    a=unique(a);
    %set(gcf,'Position',[10 10 300 1500]);
    for i=1:l 
    y1=cell2mat(log.litho(i,1));
    y2=cell2mat(log.litho(i,2));
    y3=cell2mat(log.litho(i,3));
    
    %fill(k,[y1,y1,y2,y2],'r',"FaceAlpha",0.3)
    text(0.2,(y1+y2)/2,y3)
    hold on;
    
    switch y3
        case a(1)
            fill(k,[y1,y1,y2,y2],'g',"FaceAlpha",0.3)
        case a(2)
            fill(k,[y1,y1,y2,y2],'r',"FaceAlpha",0.3)
        case a(3)
            fill(k,[y1,y1,y2,y2],'b',"FaceAlpha",0.3)
        otherwise
            fill(k,[y1,y1,y2,y2],'y',"FaceAlpha",0.3)
    end
    end
end


