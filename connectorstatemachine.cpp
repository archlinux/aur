//
// Statemachine code from reading SCXML file 'connectorstatemachine.scxml'
// Created by: The Qt SCXML Compiler version 1 (Qt 5.13.0)
// WARNING! All changes made in this file will be lost!
//

#include "connectorstatemachine.h"

#include <qscxmlinvokableservice.h>
#include <qscxmltabledata.h>
#include <QScxmlEcmaScriptDataModel>

#if !defined(Q_QSCXMLC_OUTPUT_REVISION)
#error "The header file 'connectorstatemachine.scxml' doesn't include <qscxmltabledata.h>."
#elif Q_QSCXMLC_OUTPUT_REVISION != 1
#error "This file was generated using the qscxmlc from 5.13.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The qscxmlc has changed too much.)"
#endif

struct ConnectorStateMachine::Data: private QScxmlTableData {
    Data(ConnectorStateMachine &stateMachine)
        : stateMachine(stateMachine)
    {}

    void init() {
        stateMachine.setTableData(this);
        stateMachine.setDataModel(&dataModel);
    }

    QString name() const override final
    { return string(0); }

    QScxmlExecutableContent::ContainerId initialSetup() const override final
    { return 91; }

    QScxmlExecutableContent::InstructionId *instructions() const override final
    { return theInstructions; }

    QScxmlExecutableContent::StringId *dataNames(int *count) const override final
    { *count = 1; return dataIds; }

    QScxmlExecutableContent::EvaluatorInfo evaluatorInfo(QScxmlExecutableContent::EvaluatorId evaluatorId) const override final
    { Q_ASSERT(evaluatorId >= 0); Q_ASSERT(evaluatorId < 3); return evaluators[evaluatorId]; }

    QScxmlExecutableContent::AssignmentInfo assignmentInfo(QScxmlExecutableContent::EvaluatorId assignmentId) const override final
    { Q_ASSERT(assignmentId >= 0); Q_ASSERT(assignmentId < 1); return assignments[assignmentId]; }

    QScxmlExecutableContent::ForeachInfo foreachInfo(QScxmlExecutableContent::EvaluatorId foreachId) const override final
    { Q_ASSERT(foreachId >= 0); Q_ASSERT(foreachId < 0); return foreaches[foreachId]; }

    QString string(QScxmlExecutableContent::StringId id) const override final
    {
        Q_ASSERT(id >= QScxmlExecutableContent::NoString); Q_ASSERT(id < 38);
        if (id == QScxmlExecutableContent::NoString) return QString();
        return QString({static_cast<QStringData*>(strings.data + id)});
    }

    const qint32 *stateMachineTable() const override final
    { return theStateMachineTable; }

    QScxmlInvokableServiceFactory *serviceFactory(int id) const override final;

    ConnectorStateMachine &stateMachine;
    QScxmlEcmaScriptDataModel dataModel;

    static QScxmlExecutableContent::ParameterInfo param(QScxmlExecutableContent::StringId name,
                                                        QScxmlExecutableContent::EvaluatorId expr,
                                                        QScxmlExecutableContent::StringId location)
    {
        QScxmlExecutableContent::ParameterInfo p;
        p.name = name;
        p.expr = expr;
        p.location = location;
        return p;
    }

    static QScxmlExecutableContent::InvokeInfo invoke(
            QScxmlExecutableContent::StringId id,
            QScxmlExecutableContent::StringId prefix,
            QScxmlExecutableContent::EvaluatorId expr,
            QScxmlExecutableContent::StringId location,
            QScxmlExecutableContent::StringId context,
            QScxmlExecutableContent::ContainerId finalize,
            bool autoforward)
    {
        QScxmlExecutableContent::InvokeInfo i;
        i.id = id;
        i.prefix = prefix;
        i.expr = expr;
        i.location = location;
        i.context = context;
        i.finalize = finalize;
        i.autoforward = autoforward;
        return i;
    }

    static qint32 theInstructions[];
    static QScxmlExecutableContent::StringId dataIds[];
    static QScxmlExecutableContent::EvaluatorInfo evaluators[];
    static QScxmlExecutableContent::AssignmentInfo assignments[];
    static QScxmlExecutableContent::ForeachInfo foreaches[];
    static const qint32 theStateMachineTable[];
    static struct Strings {
        QArrayData data[38];
        qunicodechar stringdata[734];
    } strings;
};

ConnectorStateMachine::ConnectorStateMachine(QObject *parent)
    : QScxmlStateMachine(&staticMetaObject, parent)
    , data(new Data(*this))
{ qRegisterMetaType<ConnectorStateMachine *>(); data->init(); }

ConnectorStateMachine::~ConnectorStateMachine()
{ delete data; }

QScxmlInvokableServiceFactory *ConnectorStateMachine::Data::serviceFactory(int id) const
{
    Q_UNUSED(id);
    Q_UNREACHABLE();
}

qint32 ConnectorStateMachine::Data::theInstructions[] = {
1, 16, 3, 5, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 2, 1, 18, 1,
16, 3, 28, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 2, 1, 18, 1, 16,
3, 30, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 2, 1, 18, 1, 16, 3,
32, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 12, 34, -1, -1, 0, 12,
34, -1, -1, 0, 1, 2, 8, 0
};

QScxmlExecutableContent::StringId ConnectorStateMachine::Data::dataIds[] = {
19
};

QScxmlExecutableContent::EvaluatorInfo ConnectorStateMachine::Data::evaluators[] = {
{ 19, 20 }, { 19, 23 }, { 19, 26 }
};

QScxmlExecutableContent::AssignmentInfo ConnectorStateMachine::Data::assignments[] = {
{ 19, 36, 37 }
};

QScxmlExecutableContent::ForeachInfo ConnectorStateMachine::Data::foreaches[] = {
{ -1, -1, -1, -1 }
};

#define STR_LIT(idx, ofs, len) \
    Q_STATIC_STRING_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(Strings, stringdata) + ofs * sizeof(qunicodechar) - idx * sizeof(QArrayData)) \
    )
ConnectorStateMachine::Data::Strings ConnectorStateMachine::Data::strings = {{
STR_LIT(0, 0, 21), STR_LIT(1, 22, 6), STR_LIT(2, 29, 10), STR_LIT(3, 40, 9),
STR_LIT(4, 50, 9), STR_LIT(5, 60, 49), STR_LIT(6, 110, 12), STR_LIT(7, 123, 9),
STR_LIT(8, 133, 12), STR_LIT(9, 146, 10), STR_LIT(10, 157, 10),
STR_LIT(11, 168, 11), STR_LIT(12, 180, 7), STR_LIT(13, 188, 9),
STR_LIT(14, 198, 4), STR_LIT(15, 203, 9), STR_LIT(16, 213, 13),
STR_LIT(17, 227, 10), STR_LIT(18, 238, 12), STR_LIT(19, 251, 9),
STR_LIT(20, 261, 60), STR_LIT(21, 322, 8), STR_LIT(22, 331, 12),
STR_LIT(23, 344, 66), STR_LIT(24, 411, 12), STR_LIT(25, 424, 5),
STR_LIT(26, 430, 59), STR_LIT(27, 490, 10), STR_LIT(28, 501, 36),
STR_LIT(29, 538, 10), STR_LIT(30, 549, 36), STR_LIT(31, 586, 7),
STR_LIT(32, 594, 33), STR_LIT(33, 628, 5), STR_LIT(34, 634, 33),
STR_LIT(35, 668, 7), STR_LIT(36, 676, 5), STR_LIT(37, 682, 50)
},{
0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x6f,0x72,0x53,0x74,0x61,0x74,0x65,0x4d,0x61,0x63,0x68,0x69,0x6e,0x65,0, // 0: ConnectorStateMachine
0x41,0x63,0x74,0x69,0x76,0x65,0, // 1: Active
0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x69,0x6e,0x67,0, // 2: Connecting
0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0, // 3: connected
0x6e,0x6f,0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0, // 4: noConnect
0x73,0x65,0x6e,0x64,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x74,0x72,0x61,0x6e,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x20,0x6f,0x66,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x27,0x41,0x63,0x74,0x69,0x76,0x65,0x27,0, // 5: send instruction in transition  of state 'Active'
0x64,0x6f,0x44,0x69,0x73,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0, // 6: doDisconnect
0x72,0x65,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0, // 7: reconnect
0x64,0x69,0x73,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0, // 8: disconnected
0x62,0x61,0x73,0x69,0x63,0x45,0x72,0x72,0x6f,0x72,0, // 9: basicError
0x66,0x61,0x74,0x61,0x6c,0x45,0x72,0x72,0x6f,0x72,0, // 10: fatalError
0x52,0x65,0x67,0x69,0x73,0x74,0x65,0x72,0x69,0x6e,0x67,0, // 11: Registering
0x61,0x63,0x63,0x6f,0x75,0x6e,0x74,0, // 12: account
0x4c,0x6f,0x67,0x67,0x69,0x6e,0x67,0x49,0x6e,0, // 13: LoggingIn
0x49,0x64,0x6c,0x65,0, // 14: Idle
0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0, // 15: Connected
0x61,0x77,0x61,0x69,0x74,0x52,0x65,0x67,0x69,0x73,0x74,0x65,0x72,0, // 16: awaitRegister
0x61,0x77,0x61,0x69,0x74,0x4c,0x6f,0x67,0x69,0x6e,0, // 17: awaitLogin
0x61,0x77,0x61,0x69,0x74,0x47,0x72,0x61,0x6e,0x74,0x65,0x64,0, // 18: awaitGranted
0x69,0x73,0x43,0x6c,0x6f,0x73,0x69,0x6e,0x67,0, // 19: isClosing
0x74,0x72,0x61,0x6e,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x41,0x63,0x74,0x69,0x76,0x65,0x20,0x77,0x69,0x74,0x68,0x20,0x63,0x6f,0x6e,0x64,0x3d,0x22,0x69,0x73,0x43,0x6c,0x6f,0x73,0x69,0x6e,0x67,0x22,0, // 20: transition instruction in state Active with cond=\"isClosing\"
0x47,0x72,0x61,0x6e,0x74,0x69,0x6e,0x67,0, // 21: Granting
0x44,0x69,0x73,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0, // 22: Disconnected
0x74,0x72,0x61,0x6e,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x44,0x69,0x73,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0x20,0x77,0x69,0x74,0x68,0x20,0x63,0x6f,0x6e,0x64,0x3d,0x22,0x69,0x73,0x43,0x6c,0x6f,0x73,0x69,0x6e,0x67,0x22,0, // 23: transition instruction in state Disconnected with cond=\"isClosing\"
0x52,0x65,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x69,0x6e,0x67,0, // 24: Reconnecting
0x52,0x65,0x74,0x72,0x79,0, // 25: Retry
0x74,0x72,0x61,0x6e,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x52,0x65,0x74,0x72,0x79,0x20,0x77,0x69,0x74,0x68,0x20,0x63,0x6f,0x6e,0x64,0x3d,0x22,0x69,0x73,0x43,0x6c,0x6f,0x73,0x69,0x6e,0x67,0x22,0, // 26: transition instruction in state Retry with cond=\"isClosing\"
0x42,0x61,0x73,0x69,0x63,0x45,0x72,0x72,0x6f,0x72,0, // 27: BasicError
0x73,0x65,0x6e,0x64,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x42,0x61,0x73,0x69,0x63,0x45,0x72,0x72,0x6f,0x72,0, // 28: send instruction in state BasicError
0x46,0x61,0x74,0x61,0x6c,0x45,0x72,0x72,0x6f,0x72,0, // 29: FatalError
0x73,0x65,0x6e,0x64,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x46,0x61,0x74,0x61,0x6c,0x45,0x72,0x72,0x6f,0x72,0, // 30: send instruction in state FatalError
0x43,0x6c,0x6f,0x73,0x69,0x6e,0x67,0, // 31: Closing
0x73,0x65,0x6e,0x64,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x43,0x6c,0x6f,0x73,0x69,0x6e,0x67,0, // 32: send instruction in state Closing
0x46,0x69,0x6e,0x61,0x6c,0, // 33: Final
0x66,0x69,0x6e,0x61,0x6c,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x28,0x6e,0x6f,0x6e,0x65,0x29,0, // 34: final instruction in state (none)
0x46,0x69,0x6e,0x61,0x6c,0x5f,0x32,0, // 35: Final_2
0x66,0x61,0x6c,0x73,0x65,0, // 36: false
0x64,0x61,0x74,0x61,0x20,0x69,0x6e,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6f,0x6e,0x20,0x69,0x6e,0x20,0x73,0x74,0x61,0x74,0x65,0x20,0x28,0x6e,0x6f,0x6e,0x65,0x29,0x20,0x77,0x69,0x74,0x68,0x20,0x65,0x78,0x70,0x72,0x3d,0x22,0x66,0x61,0x6c,0x73,0x65,0x22,0 // 37: data instruction in state (none) with expr=\"false\"
}};

const qint32 ConnectorStateMachine::Data::theStateMachineTable[] = {
	0x1, // version
	0, // name
	1, // data-model
	130, // child states array offset
	23, // transition to initial states
	-1, // initial setup
	0, // binding
	-1, // maxServiceId
	14, 15, // state offset and count
	179, 25, // transition offset and count
	329, 142, // array offset and size

	// States:
	1, -1, 0, 24, -1, -1, -1, -1, 63, 70, -1,
	2, 0, 0, -1, -1, -1, -1, -1, -1, 8, -1,
	11, 0, 0, -1, -1, -1, -1, -1, -1, 31, -1,
	13, 0, 0, -1, -1, -1, -1, -1, -1, 37, -1,
	14, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1,
	15, 0, 0, -1, -1, -1, -1, -1, -1, 51, -1,
	21, 0, 0, -1, -1, -1, -1, -1, -1, 61, -1,
	22, -1, 0, -1, -1, -1, -1, -1, -1, 84, -1,
	24, -1, 0, -1, -1, -1, -1, -1, -1, 91, -1,
	25, -1, 0, -1, -1, -1, -1, -1, -1, 99, -1,
	27, -1, 0, -1, -1, 18, -1, -1, -1, 110, -1,
	29, -1, 0, -1, -1, 39, -1, -1, -1, 121, -1,
	31, -1, 0, -1, -1, 60, -1, -1, -1, 128, -1,
	33, -1, 2, -1, -1, -1, -1, 81, -1, -1, -1,
	35, -1, 2, -1, -1, -1, -1, 86, -1, -1, -1,

	// Transitions:
	2, -1, 1, 1, 0, -1, 
	6, -1, 1, 1, 4, -1, 
	13, -1, 1, 0, 11, 0, 
	17, -1, 1, 0, 15, -1, 
	21, -1, 1, 0, 19, -1, 
	25, -1, 1, 0, 23, -1, 
	29, -1, 1, 2, 27, -1, 
	35, -1, 1, 3, 33, -1, 
	41, -1, 1, 5, 39, -1, 
	45, -1, 1, 5, 43, -1, 
	49, -1, 1, 5, 47, -1, 
	-1, 0, 1, 0, 55, -1, 
	59, -1, 1, 6, 57, -1, 
	80, -1, 1, 7, 78, -1, 
	-1, 1, 1, 7, 82, -1, 
	89, -1, 1, 8, 87, -1, 
	95, -1, 1, 9, 93, -1, 
	-1, 2, 1, 9, 97, -1, 
	104, -1, 1, 10, 102, -1, 
	108, -1, 1, 10, 106, -1, 
	115, -1, 1, 11, 113, -1, 
	119, -1, 1, 11, 117, -1, 
	126, -1, 1, 12, 124, -1, 
	-1, -1, 2, -1, 140, -1, 
	-1, -1, 2, 0, 76, -1, 

	// Arrays:
	1, 5, 
	1, 3, 
	1, 7, 
	1, 4, 
	2, 0, 1, 
	1, 8, 
	1, 7, 
	1, 9, 
	1, 8, 
	1, 10, 
	1, 9, 
	1, 11, 
	1, 10, 
	1, 4, 
	1, 12, 
	1, 6, 
	1, 4, 
	1, 12, 
	1, 7, 
	1, 2, 
	1, 16, 
	1, 3, 
	1, 17, 
	1, 6, 
	1, 18, 
	3, 8, 9, 10, 
	1, 12, 
	1, 4, 
	1, 12, 
	1, 12, 
	6, 1, 2, 3, 4, 5, 6, 
	5, 2, 3, 4, 5, 11, 
	1, 1, 
	1, 0, 
	1, 7, 
	1, 14, 
	2, 13, 14, 
	1, 0, 
	1, 8, 
	1, 15, 
	1, 0, 
	1, 7, 
	1, 13, 
	2, 16, 17, 
	1, 9, 
	1, 8, 
	1, 8, 
	1, 7, 
	2, 18, 19, 
	1, 7, 
	1, 8, 
	1, 8, 
	1, 7, 
	2, 20, 21, 
	1, 13, 
	1, 8, 
	1, 22, 
	9, 0, 7, 8, 9, 10, 11, 12, 13, 14, 
	1, 0, 

	0xc0ff33 // terminator
};

struct qt_meta_stringdata_ConnectorStateMachine_t {
    QByteArrayData data[34];
    unsigned char stringdata0[422];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ConnectorStateMachine_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ConnectorStateMachine_t qt_meta_stringdata_ConnectorStateMachine = {
    {
QT_MOC_LITERAL(0, 0, 21), // "ConnectorStateMachine"
QT_MOC_LITERAL(1, 22, 13), // "ActiveChanged"
QT_MOC_LITERAL(2, 36, 0), // ""
QT_MOC_LITERAL(3, 37, 6), // "active"
QT_MOC_LITERAL(4, 44, 17), // "ConnectingChanged"
QT_MOC_LITERAL(5, 62, 18), // "RegisteringChanged"
QT_MOC_LITERAL(6, 81, 16), // "LoggingInChanged"
QT_MOC_LITERAL(7, 98, 11), // "IdleChanged"
QT_MOC_LITERAL(8, 110, 16), // "ConnectedChanged"
QT_MOC_LITERAL(9, 127, 15), // "GrantingChanged"
QT_MOC_LITERAL(10, 143, 19), // "DisconnectedChanged"
QT_MOC_LITERAL(11, 163, 19), // "ReconnectingChanged"
QT_MOC_LITERAL(12, 183, 12), // "RetryChanged"
QT_MOC_LITERAL(13, 196, 17), // "BasicErrorChanged"
QT_MOC_LITERAL(14, 214, 17), // "FatalErrorChanged"
QT_MOC_LITERAL(15, 232, 14), // "ClosingChanged"
QT_MOC_LITERAL(16, 247, 12), // "FinalChanged"
QT_MOC_LITERAL(17, 260, 14), // "Final_2Changed"
QT_MOC_LITERAL(18, 275, 6), // "parent"
QT_MOC_LITERAL(19, 282, 6), // "Active"
QT_MOC_LITERAL(20, 289, 10), // "Connecting"
QT_MOC_LITERAL(21, 300, 11), // "Registering"
QT_MOC_LITERAL(22, 312, 9), // "LoggingIn"
QT_MOC_LITERAL(23, 322, 4), // "Idle"
QT_MOC_LITERAL(24, 327, 9), // "Connected"
QT_MOC_LITERAL(25, 337, 8), // "Granting"
QT_MOC_LITERAL(26, 346, 12), // "Disconnected"
QT_MOC_LITERAL(27, 359, 12), // "Reconnecting"
QT_MOC_LITERAL(28, 372, 5), // "Retry"
QT_MOC_LITERAL(29, 378, 10), // "BasicError"
QT_MOC_LITERAL(30, 389, 10), // "FatalError"
QT_MOC_LITERAL(31, 400, 7), // "Closing"
QT_MOC_LITERAL(32, 408, 5), // "Final"
QT_MOC_LITERAL(33, 414, 7) // "Final_2"
    },{
0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x6f,0x72,0x53,0x74,0x61,0x74,0x65,0x4d,0x61,0x63,0x68,0x69,0x6e,0x65,0, // 0: ConnectorStateMachine
0x41,0x63,0x74,0x69,0x76,0x65,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 1: ActiveChanged
0, // 2: 
0x61,0x63,0x74,0x69,0x76,0x65,0, // 3: active
0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x69,0x6e,0x67,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 4: ConnectingChanged
0x52,0x65,0x67,0x69,0x73,0x74,0x65,0x72,0x69,0x6e,0x67,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 5: RegisteringChanged
0x4c,0x6f,0x67,0x67,0x69,0x6e,0x67,0x49,0x6e,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 6: LoggingInChanged
0x49,0x64,0x6c,0x65,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 7: IdleChanged
0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 8: ConnectedChanged
0x47,0x72,0x61,0x6e,0x74,0x69,0x6e,0x67,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 9: GrantingChanged
0x44,0x69,0x73,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 10: DisconnectedChanged
0x52,0x65,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x69,0x6e,0x67,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 11: ReconnectingChanged
0x52,0x65,0x74,0x72,0x79,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 12: RetryChanged
0x42,0x61,0x73,0x69,0x63,0x45,0x72,0x72,0x6f,0x72,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 13: BasicErrorChanged
0x46,0x61,0x74,0x61,0x6c,0x45,0x72,0x72,0x6f,0x72,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 14: FatalErrorChanged
0x43,0x6c,0x6f,0x73,0x69,0x6e,0x67,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 15: ClosingChanged
0x46,0x69,0x6e,0x61,0x6c,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 16: FinalChanged
0x46,0x69,0x6e,0x61,0x6c,0x5f,0x32,0x43,0x68,0x61,0x6e,0x67,0x65,0x64,0, // 17: Final_2Changed
0x70,0x61,0x72,0x65,0x6e,0x74,0, // 18: parent
0x41,0x63,0x74,0x69,0x76,0x65,0, // 19: Active
0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x69,0x6e,0x67,0, // 20: Connecting
0x52,0x65,0x67,0x69,0x73,0x74,0x65,0x72,0x69,0x6e,0x67,0, // 21: Registering
0x4c,0x6f,0x67,0x67,0x69,0x6e,0x67,0x49,0x6e,0, // 22: LoggingIn
0x49,0x64,0x6c,0x65,0, // 23: Idle
0x43,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0, // 24: Connected
0x47,0x72,0x61,0x6e,0x74,0x69,0x6e,0x67,0, // 25: Granting
0x44,0x69,0x73,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x65,0x64,0, // 26: Disconnected
0x52,0x65,0x63,0x6f,0x6e,0x6e,0x65,0x63,0x74,0x69,0x6e,0x67,0, // 27: Reconnecting
0x52,0x65,0x74,0x72,0x79,0, // 28: Retry
0x42,0x61,0x73,0x69,0x63,0x45,0x72,0x72,0x6f,0x72,0, // 29: BasicError
0x46,0x61,0x74,0x61,0x6c,0x45,0x72,0x72,0x6f,0x72,0, // 30: FatalError
0x43,0x6c,0x6f,0x73,0x69,0x6e,0x67,0, // 31: Closing
0x46,0x69,0x6e,0x61,0x6c,0, // 32: Final
0x46,0x69,0x6e,0x61,0x6c,0x5f,0x32,0 // 33: Final_2
    }};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ConnectorStateMachine[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      15,   14, // methods
      15,  137, // properties
       0,    0, // enums/sets
       1,  197, // constructors
       0,       // flags
      15,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   89,    2, 0x06 /* Public */,
       4,    1,   92,    2, 0x06 /* Public */,
       5,    1,   95,    2, 0x06 /* Public */,
       6,    1,   98,    2, 0x06 /* Public */,
       7,    1,  101,    2, 0x06 /* Public */,
       8,    1,  104,    2, 0x06 /* Public */,
       9,    1,  107,    2, 0x06 /* Public */,
      10,    1,  110,    2, 0x06 /* Public */,
      11,    1,  113,    2, 0x06 /* Public */,
      12,    1,  116,    2, 0x06 /* Public */,
      13,    1,  119,    2, 0x06 /* Public */,
      14,    1,  122,    2, 0x06 /* Public */,
      15,    1,  125,    2, 0x06 /* Public */,
      16,    1,  128,    2, 0x06 /* Public */,
      17,    1,  131,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,
    QMetaType::Void, QMetaType::Bool,    3,

 // constructors: parameters
    0x80000000 | 2, QMetaType::QObjectStar,   18,

 // properties: name, type, flags
      19, QMetaType::Bool, 0x006a6001,
      20, QMetaType::Bool, 0x006a6001,
      21, QMetaType::Bool, 0x006a6001,
      22, QMetaType::Bool, 0x006a6001,
      23, QMetaType::Bool, 0x006a6001,
      24, QMetaType::Bool, 0x006a6001,
      25, QMetaType::Bool, 0x006a6001,
      26, QMetaType::Bool, 0x006a6001,
      27, QMetaType::Bool, 0x006a6001,
      28, QMetaType::Bool, 0x006a6001,
      29, QMetaType::Bool, 0x006a6001,
      30, QMetaType::Bool, 0x006a6001,
      31, QMetaType::Bool, 0x006a6001,
      32, QMetaType::Bool, 0x006a6001,
      33, QMetaType::Bool, 0x006a6001,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,
       6,
       7,
       8,
       9,
      10,
      11,
      12,
      13,
      14,

 // constructors: name, argc, parameters, tag, flags
       0,    1,  134,    2, 0x0e /* Public */,

       0        // eod
};

void ConnectorStateMachine::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { ConnectorStateMachine *_r = new ConnectorStateMachine((*reinterpret_cast< QObject **>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        default: break;
        }
    } else if (_c == QMetaObject::InvokeMetaMethod) {
        ConnectorStateMachine *_t = static_cast<ConnectorStateMachine *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: QMetaObject::activate(_o, &staticMetaObject, 0, _a); break;
        case 1: QMetaObject::activate(_o, &staticMetaObject, 1, _a); break;
        case 2: QMetaObject::activate(_o, &staticMetaObject, 2, _a); break;
        case 3: QMetaObject::activate(_o, &staticMetaObject, 3, _a); break;
        case 4: QMetaObject::activate(_o, &staticMetaObject, 4, _a); break;
        case 5: QMetaObject::activate(_o, &staticMetaObject, 5, _a); break;
        case 6: QMetaObject::activate(_o, &staticMetaObject, 6, _a); break;
        case 7: QMetaObject::activate(_o, &staticMetaObject, 7, _a); break;
        case 8: QMetaObject::activate(_o, &staticMetaObject, 8, _a); break;
        case 9: QMetaObject::activate(_o, &staticMetaObject, 9, _a); break;
        case 10: QMetaObject::activate(_o, &staticMetaObject, 10, _a); break;
        case 11: QMetaObject::activate(_o, &staticMetaObject, 11, _a); break;
        case 12: QMetaObject::activate(_o, &staticMetaObject, 12, _a); break;
        case 13: QMetaObject::activate(_o, &staticMetaObject, 13, _a); break;
        case 14: QMetaObject::activate(_o, &staticMetaObject, 14, _a); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        Q_UNUSED(result);
        Q_UNUSED(func);
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        ConnectorStateMachine *_t = static_cast<ConnectorStateMachine *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = _t->isActive(0); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->isActive(1); break;
        case 2: *reinterpret_cast< bool*>(_v) = _t->isActive(2); break;
        case 3: *reinterpret_cast< bool*>(_v) = _t->isActive(3); break;
        case 4: *reinterpret_cast< bool*>(_v) = _t->isActive(4); break;
        case 5: *reinterpret_cast< bool*>(_v) = _t->isActive(5); break;
        case 6: *reinterpret_cast< bool*>(_v) = _t->isActive(6); break;
        case 7: *reinterpret_cast< bool*>(_v) = _t->isActive(7); break;
        case 8: *reinterpret_cast< bool*>(_v) = _t->isActive(8); break;
        case 9: *reinterpret_cast< bool*>(_v) = _t->isActive(9); break;
        case 10: *reinterpret_cast< bool*>(_v) = _t->isActive(10); break;
        case 11: *reinterpret_cast< bool*>(_v) = _t->isActive(11); break;
        case 12: *reinterpret_cast< bool*>(_v) = _t->isActive(12); break;
        case 13: *reinterpret_cast< bool*>(_v) = _t->isActive(13); break;
        case 14: *reinterpret_cast< bool*>(_v) = _t->isActive(14); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject ConnectorStateMachine::staticMetaObject = {
    { &QScxmlStateMachine::staticMetaObject, qt_meta_stringdata_ConnectorStateMachine.data,
      qt_meta_data_ConnectorStateMachine,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *ConnectorStateMachine::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ConnectorStateMachine::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, reinterpret_cast<const char *>(
            qt_meta_stringdata_ConnectorStateMachine.stringdata0)))
        return static_cast<void*>(const_cast< ConnectorStateMachine*>(this));
    return QScxmlStateMachine::qt_metacast(_clname);
}

int ConnectorStateMachine::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QScxmlStateMachine::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 15)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 15)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 15;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 15;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 15;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}


