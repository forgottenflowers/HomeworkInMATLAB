% Calculatiing higher order terms in Quantum Field Theory.
% Perturbative expansion of light-cone Lagrangian to cubic order in the fields, on a four-dimensional de Sitter background.
% Possibly related to the paper: Light-cone gravity in dS4

syms dh;
syms dbhb;
syms dbh;
syms dhb;
d1h11=0.5*(dh+dbhb+dbh+dhb);
d2h11=i*0.5*(dbhb+dbh-dhb-dh);
d1h12=i*0.5*(dbhb+dhb-dbh-dh);
d2h12=0.5*(dhb+dbh-dh-dbhb);
dH=[d1h11 d1h12; d1h12 -d1h11];
dH(:,:,2)=[d2h11 d2h12; d2h12 -d2h11];




nos=double(par);
        len=6;
        x=1;
        for t=1:6
            for w=(t+1):6
                if nos(t)==nos(w) 
                    nos(t)=x;
                    nos(w)=x;
                    x=x+1; 
                end
            end
        end
        ans=0;
        for i=1:2
            for k=1:2
                for l=1:2
                    mult=0;
                    prod=1;
                    for o=1:2
                        o1=nos(o*3-2);
                        o2=nos(o*3-1);
                        o3=nos(o*3);
                        if o1==1 
                            if o2==1 
                                if o3==1 
                                    mult=dH(i,i,i); 
                                else
                                    if o3==2, mult=dH(i,k,i);
                                    else
                                        if o3==3, mult=dH(i,l,i); 
                                        end 
                                    end
                                end
                                  
                            else
                                if o2==2 
                                    if o3==1 
                                        mult=dH(k,i,i);
                                    else
                                        if o3==2 
                                            mult=dH(k,k,i);
                                        else
                                            if o3==3 
                                                mult=dH(k,l,i); 
                                            end 
                                        end 
                                    end
                                  
                                else
                                    if o2==3 
                                        if o3==1 
                                            mult=dH(l,i,i);
                                        else
                                            if o3==2 
                                                mult=dH(l,k,i);
                                            else
                                                if o3==3 
                                                    mult=dH(l,l,i); 
                                                end 
                                            end 
                                        end 
                                    end 
                                end 
                            end
                        else
                            if o1==2
                                if o2==1
                                    if o3==1 
                                        mult=dH(i,i,k); 
                                    else
                                        if o3==2 
                                            mult=dH(i,k,k);
                                        else
                                            if o3==3 
                                                mult=dH(i,l,k);
                                            end
                                        end
                                    end 
                                else
                                    if o2==2
                                        if o3==1
                                            mult=dH(k,i,k);
                                        else
                                            if o3==2
                                                mult=dH(k,k,k);
                                            else
                                                if o3==3
                                                    mult=dH(k,l,k);
                                                end
                                            end 
                                        end
                                    else
                                        if o2==3
                                            if o3==1 
                                                mult=dH(l,i,k);
                                            else
                                                if o3==2
                                                    mult=dH(l,k,k);
                                                else
                                                    if o3==3
                                                        mult=dH(l,l,k); 
                                                    end
                                                end 
                                            end
                                        end
                                    end 
                                end
                            else
                                 if o1==3 
                                     if o2==1
                                         if o3==1 
                                             mult=dH(i,i,l); 
                                         else
                                             if o3==2 
                                                 mult=dH(i,k,l);
                                             else
                                                 if o3==3 
                                                     mult=dH(i,l,l);
                                                 end
                                             end 
                                         end
                                     else
                                         if o2==2
                                             if o3==1 
                                                 mult=dH(k,i,l);
                                             else
                                                 if o3==2
                                                     mult=dH(k,k,l);
                                                 else
                                                     if o3==3
                                                         mult=dH(k,l,l);
                                                     end
                                                 end 
                                             end
                                         else
                                             if o2==3
                                                 if o3==1
                                                     mult=dH(l,i,l);
                                                 else
                                                     if o3==2
                                                         mult=dH(l,k,l);
                                                     else
                                                         if o3==3
                                                             mult=dH(l,l,l); 
                                                         end 
                                                     end
                                                 end 
                                             end 
                                         end 
                                     end
                                 end
                            end
                        end
                        prod=prod*mult;
                    end
                    ans=ans+prod;
                end
            end
        end

ans=expand(ans)
