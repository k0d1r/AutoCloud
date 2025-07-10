# Cloud-Auto-Mon

Flask uygulamasının AWS'de otomatik kurulumu için Terraform, Ansible ve monitoring araçları.

## Proje Yapısı

### Terraform Modülleri
- **VPC Modülü**: AWS VPC, subnet, internet gateway ve route table oluşturur.
- **EC2 Modülü**: Ubuntu sunucusu ve güvenlik grubu kurar.
- **Terragrunt**: Modüller arası bağımlılıkları yönetir.

### Ansible Playbook'ları
- **python+flask_install.yaml**: Python, pip ve Flask kurulumu yapar.
- **monitoring.yaml**: Node Exporter ve monitoring araçlarını kurar.
- **Inventory.ini**: EC2 sunucusu bağlantı bilgilerini içerir.

### Flask Uygulaması
- **app.py**: Basit Flask web uygulaması.
- **requirements.txt**: Python bağımlılıkları listesi.

## Kurulum Adımları

### 1. Altyapı Kurulumu
```bash
cd terraform
terragrunt apply --config vpc.hcl
terragrunt apply --config ec2.hcl
```

### 2. Ansible ile Yazılım Kurulumu
```bash
ansible-playbook -i ansible/Inventory.ini ansible/python+flask_install.yaml
```

### 3. Uygulama Testi
```bash
ssh -i k0d1rkey.pem ubuntu@<EC2_IP>
python3 app.py
```

## Özellikler

- **Otomatik Altyapı**: Terraform ile AWS kaynakları otomatik oluşturulur.
- **Konfigürasyon Yönetimi**: Ansible ile sunucu ayarları otomatik yapılır.
- **Monitoring**: Node Exporter ile sistem metrikleri toplanır.
- **Güvenlik**: Security group ile port erişimleri kontrol edilir.

## Teknolojiler

- **Terraform**: Altyapı kodu (IaC)
- **Terragrunt**: Terraform wrapper
- **Ansible**: Konfigürasyon yönetimi
- **Flask**: Python web framework
- **AWS**: Bulut altyapısı
- **Node Exporter**: Monitoring

## Temizlik

Kaynakları silmek için:
```bash
terragrunt destroy --config ec2.hcl
terragrunt destroy --config vpc.hcl
``` 