# Image Gallery

Bare bones JS app using daptin API. Demonstrates using asset columns. 


## Run

```
docker-compose up
```

[http://localhost:9999/gallery/](http://localhost:9999/gallery/)

## Schema

```yaml
Tables:
  - TableName: gallery_image
    Columns:
      - Name: title
        DataType: varchar(500)
        ColumnType: label
      - Name: file                # File column stores the blog to the cloud store
        DataType: text
        IsNullable: true
        ColumnType: image.png|jpg|jpeg|gif|tiff
        IsForeignKey: true
        ForeignKeyData:
          DataSource: cloud_store
          Namespace: local-store
          KeyName: images
Imports:
  - FilePath: /opt/daptin/initial_data.json
    Entity: site
    FileType: json
```

## Initial Data

```json
{
  "cloud_store": [
    {
      "name": "local-store",     # Create a store for file column
      "store_type": "local",
      "store_provider": "local",
      "root_path": "/opt/daptin/gallery",
      "store_parameters": "{}",
      "reference_id": "ca122915-4dbb-42cf-aa19-c89a14e6fa9a"
    }
  ],
  "site": [
    {
      "name": "gallery",          # create a static site
      "hostname": "gallery.daptin.com",
      "path": "gallery",
      "cloud_store_id": "ca122915-4dbb-42cf-aa19-c89a14e6fa9a"
    }
  ]
}
```