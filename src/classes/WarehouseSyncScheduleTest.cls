/**
 * Created by Alexey Dmytrenko on 10.08.2021.
 */
@isTest
public with sharing class WarehouseSyncScheduleTest {

    @isTest static void testSchedule(){

        test.StartTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());

        String jobId = System.schedule('ScheduledApexTest', '0 0 1 * * ?', new WarehouseSyncSchedule());

        test.StopTest();

        CronTrigger ct = [SELECT State FROM CronTrigger WHERE ID = :jobId];
        System.assertEquals('WAITING', String.valueOf(ct.State));

    }
}