/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Stub for kernels < 6.19 that lack linux/soc/airoha/airoha_offload.h.
 *
 * Airoha NPU offload targets ARM SoCs (MT7988) and is never active on x86.
 * This provides the types and no-op inlines that mt76.h needs to compile.
 */
#ifndef AIROHA_OFFLOAD_H
#define AIROHA_OFFLOAD_H

#include <linux/skbuff.h>

enum {
	PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED = 0x0f,
};

struct airoha_ppe_dev {
	struct {
		int (*setup_tc_block_cb)(struct airoha_ppe_dev *dev,
					 void *type_data);
		void (*check_skb)(struct airoha_ppe_dev *dev,
				  struct sk_buff *skb, u16 hash,
				  bool rx_wlan);
	} ops;

	void *priv;
};

static inline struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)
{
	return NULL;
}

static inline void airoha_ppe_put_dev(struct airoha_ppe_dev *dev)
{
}

static inline int
airoha_ppe_dev_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data)
{
	return -EOPNOTSUPP;
}

static inline void airoha_ppe_dev_check_skb(struct airoha_ppe_dev *dev,
					    struct sk_buff *skb, u16 hash,
					    bool rx_wlan)
{
}

/* Enum types referenced by mt76.h inline wrappers */
enum airoha_npu_wlan_set_cmd { __AIROHA_NPU_WLAN_SET_CMD_MAX };
enum airoha_npu_wlan_get_cmd { __AIROHA_NPU_WLAN_GET_CMD_MAX };

struct airoha_npu {};

/* DMA descriptor types referenced by dma.c */
struct airoha_npu_rx_dma_desc {
	u32 ctrl;
	u32 info;
	u32 data;
	u32 addr;
	u64 rsv;
} __packed;

#define NPU_TXWI_LEN	192

struct airoha_npu_tx_dma_desc {
	u32 ctrl;
	u32 addr;
	u64 rsv;
	u8 txwi[NPU_TXWI_LEN];
} __packed;

static inline struct airoha_npu *airoha_npu_get(struct device *dev)
{
	return NULL;
}

static inline void airoha_npu_put(struct airoha_npu *npu)
{
}

static inline int airoha_npu_wlan_init_reserved_memory(struct airoha_npu *npu)
{
	return -EOPNOTSUPP;
}

static inline int airoha_npu_wlan_send_msg(struct airoha_npu *npu,
					   int ifindex,
					   enum airoha_npu_wlan_set_cmd cmd,
					   void *data, int data_len, gfp_t gfp)
{
	return -EOPNOTSUPP;
}

static inline int airoha_npu_wlan_get_msg(struct airoha_npu *npu, int ifindex,
					  enum airoha_npu_wlan_get_cmd cmd,
					  void *data, int data_len, gfp_t gfp)
{
	return -EOPNOTSUPP;
}

static inline u32 airoha_npu_wlan_get_queue_addr(struct airoha_npu *npu,
						  int qid, bool xmit)
{
	return 0;
}

static inline void airoha_npu_wlan_set_irq_status(struct airoha_npu *npu,
						   u32 val)
{
}

static inline u32 airoha_npu_wlan_get_irq_status(struct airoha_npu *npu,
						  int q)
{
	return 0;
}

static inline void airoha_npu_wlan_enable_irq(struct airoha_npu *npu, int q)
{
}

static inline void airoha_npu_wlan_disable_irq(struct airoha_npu *npu, int q)
{
}

#endif /* AIROHA_OFFLOAD_H */
