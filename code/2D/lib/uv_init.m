function uv_init(restFile, hdlsFile, initFile, energy_type)

global ver_num dirichlet en_type cmin cmax K q u_n

colormap(jet);

en_type = energy_type;

% rest mesh
load_input_mesh(restFile);

% init mesh and hdls

mask = load(hdlsFile);
mask = mask.Expression1;
mask = uint64(mask);

num_mask = size(mask,1)

V0 = load(initFile);
V0 = V0.Expression1;


q = reshape(V0', ver_num * 2, 1);

%

dirichlet = zeros(2 * ver_num, 1);
dirichlet([2 * mask - 1, 2 * mask]) = 1;

basis = find(dirichlet == 0);
num_basis = size(basis, 1)
u_n = zeros(num_basis, 1);
k_val = ones(num_basis, 1); 

K = sparse(basis, [1:num_basis]', k_val, 2 * ver_num, num_basis);


global_cache_claim


cmax = 1;


if strcmp(en_type, 'arap')
   
    cmin = 0;
    
end

if strcmp(en_type, 'mips')
   
    cmin = 2;
    
end

if strcmp(en_type, 'iso')
   
    cmin = 4;
    
end

if strcmp(en_type, 'amips')
   
    cmin = exp(amips_s * 2);
    
end


if strcmp(en_type, 'conf')
   
    cmin = 1;
    
end



end