resource "azurerm_linux_virtual_machine_extension" "flask" {
  count               = var.vm_count
  name                = "flask-install-${count.index}"
  virtual_machine_id  = var.vm_ids[count.index]
  publisher           = "Microsoft.Azure.Extensions"
  type                = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
{
  "commandToExecute": "apt update -y && apt install -y python3-pip && pip3 install flask && echo 'from flask import Flask; app = Flask(__name__); @app.route(\"/\") def hello(): return \"Hello from VM ${count.index}\"; app.run(host=\"0.0.0.0\", port=80)' > /tmp/app.py && nohup python3 /tmp/app.py &"
}
SETTINGS
}