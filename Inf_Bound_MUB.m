d=2;%dimension
T=3;%the number of measurement bases
[B,A,MUB]=randombase(d);
B(T*d+1:(d+1)*d,:)=[];
%B=MUB;
%maximally entangled state in Hd x Hd
phi=1;
parfor i=1:d-1
    phi=[phi [zeros(1,d) 1]];
end
phi=phi/sqrt(d);

g=zeros(d^2,d^2);    
for j=1:T
    for i=1:d
        v0=kron(transpose(B((j-1)*d+i,:)),conj(B((j-1)*d+i,:)));
        v1=sqrt(d)*kron(v0,eye(d))*transpose(phi);v1=v1-(conj(phi)*v1)*transpose(phi);
        g=g+kron(v1,transpose(conj(v1)));
    end
end 
%-------RANDOM STATE
mixity=[];index=[];
parfor j=1:10000
  state=diag(rand(1,d).^20);state=state/trace(state);
  s=trace(state^2)-1/d;
  %mixity of random state
  mixity=[mixity s];                
  %random unitary
  v=2*pi*rand(1,d^2-1).^3;v=reshape(v,[1,1,d^2-1]);u=expm(1i*sum(times(v,A),3));
  state=transpose(conj(u))*state*u;
  p=diag(conj(B)*state*transpose(B));
  %-------index of coincidence
  p=p-1/d;
  index=[index sum(p.^2)];     
end
%-------FIGURE
 eg=eig(g);eg(find(eg(:)<0.0001))=[];
 sz=30;figure,
 scatter(mixity,index,sz,[.6,1,.6],'.'), hold on;
 s=0:0.001:1-1/d;
 plot(s,max(eg)*s,'r--','linewidth',1.2), hold on;         %----simple bound
   
 grid on;xlabel('mixity');ylabel('Information gain');
 axis([0,1-1/d,0,T]);
 set(get(gca,'XLabel'),'FontSize',16);
 set(get(gca,'YLabel'),'FontSize',16);
 set(get(gca,'TITLE'),'FontSize',15);  
 set(gca,'fontsize',17);
 grid on;grid minor; 

disp(transpose(eg));
