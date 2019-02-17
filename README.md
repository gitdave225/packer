# packer
This repo contains my tests on setting up various images using packer.


I utilized the following URLs as a basis for my tests:
*[StefanScherer](https://github.com/StefanScherer/packer-windows)
*[Matt Wrock](https://github.com/mwrock/packer-templates)
*[Script to move IIS](https://gallery.technet.microsoft.com/scriptcenter/Script-to-move-the-IIS-f1fb62a5) 

```
To setup versioning on a packer image, perform the following. Follow this [link](https://stackoverflow.com/questions/38056018/how-do-i-set-the-version-of-vagrant-box-created-with-vmware-fusion-using-a-meta) for the reference.
$ certutil -hashfile windows2016min-virtualbox.box MD5
MD5 hash of windows2016min-virtualbox.box:
1774ea183f97654afb31d04527b24782
CertUtil: -hashfile command completed successfully.
$ vi metadata.json
// metadata.json file used with the vagrant box add
{
  "name": "my/win2016",
  "description": "Windows 2016 Evaluation",
  "versions": [
    {
      "version": "0.1.0",
      "providers": [
        {
          "name": "virtualbox",
          "url": "file:///d:/.vagrant.d/windows2016min-virtualbox.box",
          "checksum_type": "md5",
          "checksum": "1774ea183f97654afb31d04527b24782"
        }
      ]
    }
  ]
}
$ vagrant box add metadata.json --provider virtualbox
==> box: Loading metadata for box 'metadata.json'
    box: URL: file://d:/.vagrant.d/metadata.json
==> box: Adding box 'my/win2016' (v0.1.0) for provider: virtualbox
    box: Unpacking necessary files from: file:///d:/.vagrant.d/windows2016min-virtualbox.box
    box: Progress: 100% (Rate: 117M/s, Estimated time remaining: --:--:--)
    box: Calculating and comparing box checksum...
==> box: Successfully added box 'my/win2016' (v0.1.0) for 'virtualbox'!
$
```
