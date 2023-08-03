using { guitarStoreSrv } from '../srv/service.cds';

annotate guitarStoreSrv.Product with @odata.draft.enabled;
annotate guitarStoreSrv.Audience with @odata.draft.enabled;
annotate guitarStoreSrv.Warehouse with @odata.draft.enabled;
annotate guitarStoreSrv.Audience with @cds.odata.valuelist;
annotate guitarStoreSrv.Warehouse with @cds.odata.valuelist;
annotate guitarStoreSrv.Product with @cds.odata.valuelist;
annotate guitarStoreSrv.Product with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: productName } };
annotate guitarStoreSrv.Product with {
  ID @Common.Text: { $value: productName, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Product with @UI.Identification: [{ Value: productName }];
annotate guitarStoreSrv.Product with {
  productName @title: 'Product Name';
  productDescription @title: 'Product Description';
  price @title: 'Price'
};

annotate guitarStoreSrv.Product with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: productDescription },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Audience', Value: targetAudience_ID },
    { $Type: 'UI.DataField', Label: 'Warehouse', Value: warehouseStock_ID }
];

annotate guitarStoreSrv.Product with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productName },
    { $Type: 'UI.DataField', Value: productDescription },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Audience', Value: targetAudience_ID },
    { $Type: 'UI.DataField', Label: 'Warehouse', Value: warehouseStock_ID }
  ]
};

annotate guitarStoreSrv.Product with {
  targetAudience @Common.Text: { $value: targetAudience.audiencePitch, ![@UI.TextArrangement]: #TextOnly }
};

annotate guitarStoreSrv.Product with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Discount', Target : 'discounts/@UI.LineItem' }
];

annotate guitarStoreSrv.Audience with @UI.HeaderInfo: { TypeName: 'Audience', TypeNamePlural: 'Audiences', Title: { Value: audiencePitch } };
annotate guitarStoreSrv.Audience with {
  ID @Common.Text: { $value: audiencePitch, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Audience with @UI.Identification: [{ Value: audiencePitch }];
annotate guitarStoreSrv.Audience with {
  audiencePitch @title: 'Audience Pitch'
};

annotate guitarStoreSrv.Audience with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: audiencePitch }
];

annotate guitarStoreSrv.Audience with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: audiencePitch }
  ]
};

annotate guitarStoreSrv.Audience with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitarStoreSrv.Warehouse with @UI.HeaderInfo: { TypeName: 'Warehouse', TypeNamePlural: 'Warehouses', Title: { Value: stockQuantity } };
annotate guitarStoreSrv.Warehouse with {
  ID @Common.Text: { $value: stockQuantity, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Warehouse with @UI.Identification: [{ Value: stockQuantity }];
annotate guitarStoreSrv.Warehouse with {
  stockQuantity @title: 'Stock Quantity'
};

annotate guitarStoreSrv.Warehouse with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: stockQuantity }
];

annotate guitarStoreSrv.Warehouse with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: stockQuantity }
  ]
};

annotate guitarStoreSrv.Warehouse with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate guitarStoreSrv.Discount with @UI.HeaderInfo: { TypeName: 'Discount', TypeNamePlural: 'Discounts', Title: { Value: discountPercentage } };
annotate guitarStoreSrv.Discount with {
  ID @Common.Text: { $value: discountPercentage, ![@UI.TextArrangement]: #TextOnly }
};
annotate guitarStoreSrv.Discount with @UI.Identification: [{ Value: discountPercentage }];
annotate guitarStoreSrv.Discount with {
  discountPercentage @title: 'Discount Percentage'
};

annotate guitarStoreSrv.Discount with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: discountPercentage }
];

annotate guitarStoreSrv.Discount with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: discountPercentage }
  ]
};

annotate guitarStoreSrv.Discount with {
  product @Common.Text: { $value: product.productName, ![@UI.TextArrangement]: #TextOnly }
};

annotate guitarStoreSrv.Discount with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

