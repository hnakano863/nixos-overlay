final: prev: {
  julia-1_5_2 = final.callPackage ./template.nix {
    major = "1";
    minor = "5";
    patch = "2";
    sha256 = "0k3bpw8v07b70z50dyvjgz5wc58bnvw505lfcssczmhpfqd5zj49";
  };

  julia-1_5_3 = final.callPackage ./template.nix {
    major = "1";
    minor = "5";
    patch = "3";
    sha256 = "1yc60dl39sa0rbiaj2v7vf79j0c9zd93h1mwcahq99w44c81k3q6";
  };

  julia-1_5_4 = final.callPackage ./template.nix {
    major = "1";
    minor = "5";
    patch = "4";
    sha256 = "0bb8fr692dqrf718p644y5swd3z8ivh4ysdaw7q0cir10cc16nym";
  };

  julia-1_6_0 = final.callPackage ./template.nix {
    major = "1";
    minor = "6";
    patch = "0";
    sha256 = "1bc0hgb6h37i64dqg28h43brlpsclbwn2qpjy4fyiz2182z3zcfs";
  };

  julia-1_6_1 = final.callPackage ./template.nix {
    major = "1";
    minor = "6";
    patch = "1";
    sha256 = "0xajwhc2lv9l8n7spmsp99a2z1ff426jv5jr0419ls34q9di8cfw";
  };

  julia-1_6_2 = final.callPackage ./template.nix {
    major = "1";
    minor = "6";
    patch = "2";
    sha256 = "0dhwllf8zjggfzd0h63pxpcp1dwiq4i8i3fiasz61sfvmkyshh83";
  };

  julia-1_6_3 = final.callPackage ./template.nix {
    major = "1";
    minor = "6";
    patch = "3";
    sha256 = "1wscc2g3yxs1ch7hsmxm156ryfh3i8bar6dr5ng4w174hx6zyxll";
  };

  julia-1_7_0 = final.callPackage ./template.nix {
    major = "1";
    minor = "7";
    patch = "0";
    sha256 = "14iqglqj61yk41jq9k3blc71kgdzx17ylh4f96mq6dawbwqvxnlc";
  };

  julia-bin = final.julia-1_7_0;

}
