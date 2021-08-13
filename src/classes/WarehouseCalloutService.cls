/**
 * Created by Alexey Dmytrenko on 10.08.2021.
 */
public with sharing class WarehouseCalloutService implements Queueable, Database.AllowsCallouts {
    public static void execute(QueueableContext qc){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-superbadge-apex.herokuapp.com/equipment?_ga=2.262837836.1779026755.1624865411-1289941387.1624348990');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            List<Product2> givenEquipments = (List<Product2>)JSON.deserialize(response.getBody(), List<Product2>.class);
            List<Product2> equipments = new List<Product2>();
            for(Product2 equipment : givenEquipments){
                equipments.add(new Product2(Id = equipment.id,
                        Name = equipment.name,
                        Replacement_Part__c = true,
                        QuantityUnitOfMeasure = equipment.QuantityUnitOfMeasure,
                        Cost__c = equipment.Cost__c,
                        Maintenance_Cycle__c = equipment.Maintenance_Cycle__c,
                        Lifespan_Months__c = equipment.Lifespan_Months__c,
                        Warehouse_SKU__c = equipment.Warehouse_SKU__c));
            }
            upsert equipments;
        }
    }
}