/*******************************************************************************
 * This file is part of BOINC.
 * http://boinc.berkeley.edu
 * Copyright (C) 2012 University of California
 * 
 * BOINC is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation,
 * either version 3 of the License, or (at your option) any later version.
 * 
 * BOINC is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with BOINC.  If not, see <http://www.gnu.org/licenses/>.
 ******************************************************************************/
package edu.berkeley.boinc.client;

import java.util.List;
import edu.berkeley.boinc.rpc.AccountOut;
import edu.berkeley.boinc.rpc.ProjectConfig;
import edu.berkeley.boinc.rpc.AcctMgrInfo;
import edu.berkeley.boinc.rpc.Message;
import edu.berkeley.boinc.rpc.Notice;
import edu.berkeley.boinc.rpc.Transfer;
import edu.berkeley.boinc.rpc.GlobalPreferences;
import edu.berkeley.boinc.rpc.HostInfo;
import edu.berkeley.boinc.rpc.ProjectInfo;
import edu.berkeley.boinc.rpc.Project;
import edu.berkeley.boinc.rpc.Result;
import edu.berkeley.boinc.rpc.ImageWrapper;

interface IMonitor {
/////// client interface //////////////////////////////////////////
boolean attachProject(in String url, in String id, in String pwd); // implement: call clientInterface.attachProject(url, id, pwd);
boolean checkProjectAttached(in String url);       // implement: call clientInterface.checkProjectAttached(url);
AccountOut lookupCredentials(in String url, in String id, in String pwd, in boolean usesName);  // implement: call clientInterface.lookupCredentials(url, id, pwd, usesName);
boolean projectOp(in int status, String url);             // implement: call clientInterface.projectOp(RpcClient.PROJECT_DETACH,url);
boolean resultOp(in int op, in String url, in String name);      // implement: call clientInterface.resultOp(int, String, String);
AccountOut createAccountPolling(in String url, in String email, in String id, in String pw, in String team);  // implement: call clientInterface.createAccountPolling(url, email, userName, pwd, teamName);
String readAuthToken(in String path);               // implement: call clientInterface.readAuthToken(String);
ProjectConfig getProjectConfigPolling(in String url);    // implement: call clientInterface.getProjectConfigPolling(url);
int addAcctMgrErrorNum(in String url, in String userName, in String pwd);  // implement: return clientInterface.addAcctMgr(url, userName, pwd).error_num; check return null!=clientInterface.addAcctMgr(url, userName, pwd)
AcctMgrInfo getAcctMgrInfo();               // implement: call clientInterface.getAcctMgrInfo();
boolean synchronizeAcctMgr(in String url);         // implement: call clientInterface.synchronizeAcctMgr(String);
boolean setRunMode(in int mode);                // implement: call clientInterface.setRunMode(Integer);
boolean setNetworkMode(in int mode);            // implement: call clientInterface.setNetworkMode(Integer);
List<Message> getEventLogMessages(in int seq, in int num);  // implement: call clientInterface.getEventLogMessages(int, Integer);
List<Message> getMessages(in int seq);        // implement: call clientInterface.getMessages(Integer);
List<Notice> getNotices(in int seq);          // implement: call clientInterface.getNotices(int);
boolean setCcConfig(in String config);                // implement: call clientInterface.setCcConfig(String);
boolean setGlobalPreferences(in GlobalPreferences pref);   // implement: call clientInterface.setGlobalPreferences(GlobalPreferences);
boolean transferOperation(in List<Transfer> list, in int op);  // implement: call clientInterface.transferOperation(ArrayList<transfer>, int);
List<Notice> getServerNotices();        // implement: call clientInterface.getServerNotices()

/////// general //////////////////////////////////////////
void quitClient();                               // implement: call Monitor.quitClient();
void forceRefresh();                        // implement: call Monitor.forceRefresh();
boolean isStationaryDeviceSuspected();               // implement: call Monitor.getDeviceStatus().isStationaryDevice();
int getBatteryChargeStatus();           // implement: return getDeviceStatus().getStatus().battery_charge_pct;
String getAuthFilePath();               // implement: return Monitor.getAuthFilePath();
int getBoincPlatform();                        // should be not necessary to be implemented as monitor interface
void cancelNoticeNotification();

/////// client status //////////////////////////////////////////
List<ProjectInfo> getSupportedProjects();  // clientstatus.getSupportedProjects();
boolean getAcctMgrInfoPresent();  // clientStatus.getAcctMgrInfo().present;
int getSetupStatus();         // clientStatus.setupStatus;
int getComputingStatus();     // clientStatus.computingStatus;
int getComputingSuspendReason(); // clientStatus.computingSuspendReason;
int getNetworkSuspendReason();   // clientStatus.networkSuspendReason;
String getCurrentStatusTitle(); // status.getCurrentStatusTitle()
String getCurrentStatusDescription(); // status.getCurrentStatusDescription()
HostInfo getHostInfo();            // clientStatus.getHostInfo()
GlobalPreferences getPrefs();        // clientStatus.getPrefs()
List<Project> getProjects();    // clientStatus.getProjects();
AcctMgrInfo getClientAcctMgrInfo();   // clientStatus.getAcctMgrInfo();                                     
List<Transfer> getTransfers();   // clientStatus.getTransfers();
List<Result> getTasks();          // clientStatus.getTasks();
Bitmap getProjectIconByName(in String name);  // clientStatus.getProjectIconByName(entries.get(position).project_name);
Bitmap getProjectIcon(in String id);        // clientStatus.getProjectIcon(entries.get(position).id);
String getProjectStatus(in String url);   // clientStatus.getProjectStatus(url);
List<Notice> getRssNotices();             // clientStatus.getRssNotices();
List<ImageWrapper> getSlideshowForProject(in String url);   // clientStatus.getSlideshowForProject(url);

////// app preference ////////////////////////////////////////////
void setAutostart(in boolean isAutoStart);          // Monitor.getAppPrefs().setAutostart(boolean);
void setShowNotification(in boolean isShow);   // Monitor.getAppPrefs().setShowNotification(boolean);
boolean getShowAdvanced();           // Monitor.getAppPrefs().getShowAdvanced();
boolean getAutostart();              // Monitor.getAppPrefs().getAutostart();
boolean getShowNotification();       // Monitor.getAppPrefs().getShowNotification();
int getLogLevel();                   // Monitor.getAppPrefs().getLogLevel();
void setLogLevel(in int level);               // Monitor.getAppPrefs().setLogLevel(int);
void setPowerSourceAc(in boolean src);      // Monitor.getAppPrefs().setPowerSourceAc(boolean);
void setPowerSourceUsb(in boolean src);     // Monitor.getAppPrefs().setPowerSourceUsb(boolean);
void setPowerSourceWireless(in boolean src); // Monitor.getAppPrefs().setPowerSourceWireless(boolean);
boolean getStationaryDeviceMode();           // Monitor.getAppPrefs().getStationaryDeviceMode();
boolean getPowerSourceAc();
boolean getPowerSourceUsb();
boolean getPowerSourceWireless();
void setShowAdvanced(in boolean isShow);
void setStationaryDeviceMode(in boolean mode);
boolean getSuspendWhenScreenOn();
void setSuspendWhenScreenOn(in boolean swso);                                         
}