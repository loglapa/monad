# Copyright (C) 2025-26 Category Labs, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# The MONAD_NEXT Amsterdam spec-test fixtures (EIP-7708, EIP-7843, EIP-8024)
# expect a block header carrying the SLOTNUM field, which the execution layer
# does not yet emit.
# Drop entries here to re-enable individual tests as support lands.
set(MONAD_NEXT_amsterdam_excluded_tests
  "BlockchainTests.for_monad_next/amsterdam/eip7843_slotnum/*"
  "BlockchainTests.for_monad_next/amsterdam/eip7708_eth_transfer_logs/*"
  "BlockchainTests.for_monad_next/amsterdam/eip8024_dupn_swapn_exchange/*"
  # Test contains a EIP-4844 blob which is disabled on Monad
  "BlockchainTests.for_monad_next/amsterdam/eip7981_increase_access_list_cost/transaction_validity/transactions_without_access_list.json"
  # The pinned bundle is generated against a spec that does not implement
  # EIP-8246, which this commit does: upstream carries an EIP8246 fork class and
  # a selfdestruct_no_burn test directory, but the class is a stub and no
  # fixtures are generated from it. So these selfdestruct expectations still
  # encode the pre-8246 deletion and fail on a postState missing the
  # balance-only account 8246 now preserves. Drop them when a bundle generated
  # against a spec that really has 8246 is pinned.
  #
  # The mip4_checkreservebalance entry is coarser than the rest: gtest filters
  # per file, and that file's cases are mostly selfdestruct_False ones 8246 does
  # not touch, so they are suppressed as collateral.
  #
  # Names are fs::relative(path, blockchain_tests), so every one begins
  # for_monad_next/.
  "BlockchainTests.for_monad_next/cancun/eip6780_selfdestruct/selfdestruct/create_selfdestruct_same_tx.json"
  "BlockchainTests.for_monad_next/cancun/eip6780_selfdestruct/selfdestruct/recreate_self_destructed_contract_different_txs.json"
  "BlockchainTests.for_monad_next/cancun/eip6780_selfdestruct/selfdestruct/self_destructing_initcode.json"
  "BlockchainTests.for_monad_next/cancun/eip6780_selfdestruct/selfdestruct_revert/selfdestruct_created_in_same_tx_with_revert.json"
  "BlockchainTests.for_monad_next/frontier/create/create_suicide_during_init/create_suicide_during_transaction_create.json"
  "BlockchainTests.for_monad_next/monad_nine/mip4_checkreservebalance/transfers/contract_unrestricted_within_initcode.json"
  "BlockchainTests.for_monad_next/paris/security/selfdestruct_balance_bug/tx_selfdestruct_balance_bug.json"
  "BlockchainTests.for_monad_next/tangerine_whistle/eip150_operation_gas_costs/eip150_selfdestruct/initcode_selfdestruct_to_self.json"
  "BlockchainTests.for_monad_next/tangerine_whistle/eip150_operation_gas_costs/eip150_selfdestruct/selfdestruct_to_self.json"
)
