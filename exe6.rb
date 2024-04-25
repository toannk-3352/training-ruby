=begin
Cho một params có định dạng như sau:
params = {
  "supplier"=>{
    "name"=>"Test lay params", 
    "tax_number"=>"0110254854", 
    "address"=>"Tokyo", 
    "supplier_type"=>"personal",         
    "bank_accounts"=>{
      "0"=>{
        "account"=>"847445", 
        "branch_name"=>"VCB"
      }, 
      "1"=>{
        "account"=>"985784", 
        "branch_name"=>"ACB", 
        "_destroy"=>"false"
      }
    }
  }
}
a, Lấy ra branch_name của bank_account có key = 1 
OUTPUT: 
“ACB”

b, Thêm type = “personal" cho supplier
OUTPUT:
{"supplier"=>{"name"=>"Test lay params", "tax_number"=>"0110254854", "address"=>"Tokyo", "supplier_type"=>"personal", "bank_accounts"=>{"0"=>{"account"=>"847445", "branch_name"=>"VCB"}, "1591686336292"=>{"account"=>"985784", "branch_name"=>"ACB", "_destroy"=>"false"}}}, "type"=>"personal"}

=end


params = {
  'supplier' => {
    'name' => 'Test lay params',
    'tax_number' => '0110254854',
    'address' => 'Tokyo',
    'supplier_type' => 'personal',
    'bank_accounts' => {
      '0' => {
        'account' => '847445',
        'branch_name' => 'VCB'
      },
      '1' => {
        'account' => '985784',
        'branch_name' => 'ACB',
        '_destroy' => 'false'
      }
    }
  }
}
puts params['supplier']['bank_accounts']['1']['branch_name']
params['type'] = 'personal'
puts params
