package it.anonym.util;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.Collections;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Bool;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.Utf8String;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.RemoteFunctionCall;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tx.Contract;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.gas.ContractGasProvider;

/**
 * <p>Auto generated code.
 * <p><strong>Do not modify!</strong>
 * <p>Please use the <a href="https://docs.web3j.io/command_line.html">web3j command line tools</a>,
 * or the org.web3j.codegen.SolidityFunctionWrapperGenerator in the 
 * <a href="https://github.com/web3j/web3j/tree/master/codegen">codegen module</a> to update.
 *
 * <p>Generated with web3j version 1.4.1.
 */
@SuppressWarnings("rawtypes")
public class SmartContract extends Contract {
    public static final String BINARY = "608060405234801561001057600080fd5b50600080546001600160a01b031916331790556106da806100326000396000f3fe608060405234801561001057600080fd5b506004361061004c5760003560e01c806320ef389a146100515780636b23673014610066578063a2786e1714610079578063bed34bba146100a2575b600080fd5b61006461005f366004610531565b6100c5565b005b61006461007436600461055b565b61017d565b61008c61008736600461050f565b6102da565b60405161009991906105f4565b60405180910390f35b6100b56100b0366004610574565b610374565b6040519015158152602001610099565b6000546001600160a01b031633146101195760405162461bcd60e51b815260206004820152601360248201527221b0b63632b91034b9903737ba1037bbb732b960691b604482015260640160405180910390fd5b604080518082018252600a815269546f20436f6e6669726d60b01b60208083019182526001600160a01b0386166000908152600190915292909220905161016092906103cd565b506001600160a01b03909116600090815260026020526040902055565b3360008181526001602052604090208054610242919061019c90610653565b80601f01602080910402602001604051908101604052809291908181526020018280546101c890610653565b80156102155780601f106101ea57610100808354040283529160200191610215565b820191906000526020600020905b8154815290600101906020018083116101f857829003601f168201915b50505050506040518060400160405280600a815260200169546f20436f6e6669726d60b01b815250610374565b156102d6576001600160a01b038116600090815260026020908152604091829020548251918201859052918291016040516020818303038152906040528051906020012014156102d457604080518082018252600981526810dbdb999a5c9b595960ba1b60208083019182526001600160a01b038616600090815260019091529290922090516102d292906103cd565b505b505b5050565b600160205260009081526040902080546102f390610653565b80601f016020809104026020016040519081016040528092919081815260200182805461031f90610653565b801561036c5780601f106103415761010080835404028352916020019161036c565b820191906000526020600020905b81548152906001019060200180831161034f57829003601f168201915b505050505081565b60008160405160200161038791906105d8565b60405160208183030381529060405280519060200120836040516020016103ae91906105d8565b6040516020818303038152906040528051906020012014905092915050565b8280546103d990610653565b90600052602060002090601f0160209004810192826103fb5760008555610441565b82601f1061041457805160ff1916838001178555610441565b82800160010185558215610441579182015b82811115610441578251825591602001919060010190610426565b5061044d929150610451565b5090565b5b8082111561044d5760008155600101610452565b80356001600160a01b038116811461047d57600080fd5b919050565b600082601f83011261049357600080fd5b813567ffffffffffffffff808211156104ae576104ae61068e565b604051601f8301601f19908116603f011681019082821181831017156104d6576104d661068e565b816040528381528660208588010111156104ef57600080fd5b836020870160208301376000602085830101528094505050505092915050565b60006020828403121561052157600080fd5b61052a82610466565b9392505050565b6000806040838503121561054457600080fd5b61054d83610466565b946020939093013593505050565b60006020828403121561056d57600080fd5b5035919050565b6000806040838503121561058757600080fd5b823567ffffffffffffffff8082111561059f57600080fd5b6105ab86838701610482565b935060208501359150808211156105c157600080fd5b506105ce85828601610482565b9150509250929050565b600082516105ea818460208701610627565b9190910192915050565b6020815260008251806020840152610613816040850160208701610627565b601f01601f19169190910160400192915050565b60005b8381101561064257818101518382015260200161062a565b838111156102d25750506000910152565b600181811c9082168061066757607f821691505b6020821081141561068857634e487b7160e01b600052602260045260246000fd5b50919050565b634e487b7160e01b600052604160045260246000fdfea2646970667358221220e29f4cb39a745164843c9aefa45da5bbb3fd1be8a9df3c308f3cb72504bc363064736f6c63430008070033";

    public static final String FUNC_COMPARESTRINGS = "compareStrings";

    public static final String FUNC_SETCHALLENGE = "setChallenge";

    public static final String FUNC_SOLVECHALLENGE = "solveChallenge";

    public static final String FUNC_STATEMAP = "stateMap";

    @Deprecated
    protected SmartContract(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected SmartContract(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected SmartContract(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected SmartContract(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteFunctionCall<Boolean> compareStrings(String a, String b) {
        final Function function = new Function(FUNC_COMPARESTRINGS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Utf8String(a), 
                new org.web3j.abi.datatypes.Utf8String(b)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}));
        return executeRemoteCallSingleValueReturn(function, Boolean.class);
    }

    public RemoteFunctionCall<TransactionReceipt> setChallenge(String user, byte[] challenge) {
        final Function function = new Function(
                FUNC_SETCHALLENGE, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, user), 
                new org.web3j.abi.datatypes.generated.Bytes32(challenge)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<TransactionReceipt> solveChallenge(byte[] solution) {
        final Function function = new Function(
                FUNC_SOLVECHALLENGE, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Bytes32(solution)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteFunctionCall<String> stateMap(String param0) {
        final Function function = new Function(FUNC_STATEMAP, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(160, param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Utf8String>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    @Deprecated
    public static SmartContract load(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new SmartContract(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static SmartContract load(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new SmartContract(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static SmartContract load(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return new SmartContract(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static SmartContract load(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new SmartContract(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static RemoteCall<SmartContract> deploy(Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(SmartContract.class, web3j, credentials, contractGasProvider, BINARY, "");
    }

    public static RemoteCall<SmartContract> deploy(Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(SmartContract.class, web3j, transactionManager, contractGasProvider, BINARY, "");
    }

    @Deprecated
    public static RemoteCall<SmartContract> deploy(Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(SmartContract.class, web3j, credentials, gasPrice, gasLimit, BINARY, "");
    }

    @Deprecated
    public static RemoteCall<SmartContract> deploy(Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(SmartContract.class, web3j, transactionManager, gasPrice, gasLimit, BINARY, "");
    }
}
