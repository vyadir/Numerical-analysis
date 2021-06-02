function[xi,wi] = RK4_MET(a,b,y0,f,n)
    h=(b-a)/n; 
    T=zeros(1,n+1);
    Y=zeros(1,n+1); 
    T=a:h:b;
    Y(1)=y0;
        for j=1:n
            k1=h*feval(f,T(j),Y(j));
            k2=h*feval(f,T(j)+h/2,Y(j)+k1/2);
            k3=h*feval(f,T(j),Y(j));
            k4=h*feval(f,T(j)+h,Y(j)+k3);
            Y(j+1)=Y(j)+(k1+2*k2+2*k3+k4)/6;
        end
    xi = T';
    wi = Y';
end 