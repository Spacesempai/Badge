/**
 * Created by Alexey Dmytrenko on 10.08.2021.
 */
@IsTest
public class WarehouseCalloutServiceTest {
    @TestSetup
    static void makeData(){
        Product2 equipment = new Product2(Name = 'G');
        insert equipment;
    }
    @isTest static void testGetCallout(){
        test.StartTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        string updatedEquipmentName = 'Generator 1000 kW';
        System.enqueueJob(new WarehouseCalloutService());
        test.StopTest();
        system.assert([select Name from Product2][1].get('Name') == updatedEquipmentName);
    }

}