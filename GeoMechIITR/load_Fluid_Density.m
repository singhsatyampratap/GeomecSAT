function log=load_Fluid_Density(log)
    
    opts=questdlg("Do you want to use single fluid Density for whole log","Select","Yes","No(use well section)","Yes");
    switch opts
        case "Yes"
            
            
            prompt = {'Fluid Density'};
            dlgtitle = 'Enter Fluid Density';
            dims = [1 35];
            definput = {'1000'};
            answer = inputdlg(prompt,dlgtitle,dims,definput);
            a=str2num(answer{1});
            log.Fluid_Density=a*ones(length(log.Depth),1);
            
        case "No(use well section)"
                if isfield(log,"section")==0
                    log=load_well_section(log);
                end
                a=[];
                len_sectiontype=length(log.section);
                for i=1:len_sectiontype
                    a=[a, log.section(i,3)];
                end
                a=unique(a);
                len_a=length(a);
                prompt = a;
                dlgtitle = "Please Enter Respective Density Value" ;
                answer = inputdlg(prompt,dlgtitle);
                answer=answer';
                for i=1:length(log.section)
                    [~,indx1,indx2]=closest_point(-log.Depth, ...
                        [cell2mat(log.section(i,1)),cell2mat(log.section(i,2))]);
                    for j=1:len_a
                        if strcmpi(cell2mat(log.section(i,3)),cell2mat(a(j)))
                            data(indx1:indx2)=str2double(answer(j));
                        end
                    end
                end
                 log.Fluid_Density=data';
    
    
            
            
    end
    log.other=[log.other,{"Fluid_Density"}];
    
end