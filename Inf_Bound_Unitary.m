d=2;%dimension
T=3;%the number of measurement bases (unitaries)
B=eye(d);
for k=1:T-1
    B=[B;RandomUnitary(d)];
end %T bases in total
%-------Overlap matrix--
W=conj(B)*transpose(B);W=abs(W.^2);
eig_W=sort(eig(W),'descend');eig_g=eig_W(2);%the first eigenvalue of view operator equals to the second eigenvalue of W
%-------RANDOM STATE----
mixity=[];index=[];
parfor k=1:10000
  state=diag(rand(1,d).^20);state=state/trace(state);
  s=trace(state^2)-1/d; 
  mixity=[mixity s];  %mixity of random state                
  u=RandomUnitary(d);
  state=transpose(conj(u))*state*u;
  p=diag(conj(B)*state*transpose(B)); %probability vector for outcomes
  p=p-1/d;
  index=[index sum(p.^2)];%sum of Information gain   
end
%-------FIGURE
 sz=30;figure,
 scatter(mixity,index,sz,[.6,1,.6],'.'), hold on;
 s=0:0.001:1-1/d;
 plot(s,eig_g*s,'r--','linewidth',1.2), hold on; %our upper bound on information gain given in Eq.(11) of the main text
   
 grid on;xlabel('mixity');ylabel('Information gain');
 axis([0,1-1/d,0,T]);
 set(get(gca,'XLabel'),'FontSize',16);
 set(get(gca,'YLabel'),'FontSize',16);
 set(get(gca,'TITLE'),'FontSize',15);  
 set(gca,'fontsize',17);
 grid on;grid minor; 

disp(transpose(eig_W));
