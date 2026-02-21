library(ggplot2)
library(patchwork)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(ggwordcloud)



#4.1 Main Issues of Government Works
P4_1 <- ggplot(ggdata_bar, aes(x = beta, y = reorder(Term,beta))) +
  geom_col(fill = "#4C72B0") +  # 子刊蓝，可改
  geom_text(aes(label = Term),
            hjust = -0.1, size = 3) +  # 标签靠右
  scale_x_continuous(expand = expansion(mult = c(0, 0.15))) +
  labs(
    x = "beta",
    y = "Term"
  ) +
  facet_wrap(~ Topic, ncol = 3, scales = "free_y") +  # 18 个子图
  theme_bw() +
  theme(
    strip.text = element_text(face = "bold", size = 11),
    axis.text.y = element_blank(),     # 隐藏 y 轴文字（因为有标签）
    axis.ticks.y = element_blank(),
    axis.text.x = element_text(size = 8)
  )+
  theme(
    strip.background = element_rect(fill = "skyblue3", color = "skyblue3", size = 0.8),
    strip.text = element_text(face = "bold", size = 11, color = "white")
  )
P4_1
ggsave(filename = "topic_word.png", P4_1, width = 9, height = 12, units = "in", dpi = 300)

#4.3 Effects on Non-Energy and Non-Environment Issues
p2 <- ggplot(ggdata4_3, aes(Coef, G))+ 
  geom_point(aes(color = ifelse(Lower > 0, 'darkolivegreen', "black")),size=2.4) +
  geom_errorbarh(aes(xmax =Upper, xmin = Lower, color = ifelse(Lower > 0, 'darkolivegreen', "black")), height = 0.3,size=0.75) + 
  geom_vline(aes(xintercept = 0),linetype="dashed")+
  xlab("Public environmental appeals")+ylab("")+
  scale_color_manual(
    name = "Confidence interval",  
    values = c("black",'darkolivegreen'),
    labels = c("Lower Bound < 0","Lower Bound > 0")
  )+theme_bw()+
  theme(axis.text = element_text(size = 12,colour = "black"),
        axis.title = element_text(size = 16,colour = "black"),
        legend.position = c(0.9, 0.05),
        legend.background = element_rect(fill = alpha('white', 0.1)),
        legend.text = element_text(size = 10,colour = "black"),
        legend.title = element_text(size = 12, colour = "black"))

p2
ggsave(filename = "4.3.png", plot = p2, width = 12, height = 8, units = "in", dpi = 300)




#4.4.2 Coherence Evaluation for Government Work Items

pcoh <- ggplot(coh, aes(x = topic, y = coherence)) +
  geom_col(fill = "steelblue") +
  geom_hline(yintercept = coh_mean, color = "red", linetype = "dashed", size = 1) +
  scale_y_continuous(expand = c(0, 0.001))+
  labs(
    x = "Government work",
    y = "Coherence",
    title = ""
  ) +
  theme_classic()
pcoh

ggsave("pcoh.jpeg",pcoh,dpi = 400,width = 6, height = 4,)


#4.4.3 Bootstrap Stability Test for Government Work Items

pja_test <- ggplot(ja_test , aes(x = iteration, y = jaccard)) +
  geom_line(size = 0.5, color = "steelblue") +
  geom_point(shape = 21,size = 1.5, color = "steelblue",fill = "white") +
  geom_hline(yintercept = boot_jaccard_mean_overall, 
             linetype = "dashed", color = "red") +
  labs(
    x = "Bootstrap iteration",
    y = "Jaccard similarity"
  ) +
  theme_classic()
pja_test
ggsave("pja_test.jpeg",pja_test,dpi = 400,width = 6, height = 4)


#4.4.4 Entropy Measure for the Estimation of Government Work Items
pent <- ggplot(df_entropy, aes(x = method, y = entropy)) +
  geom_col(fill = "#1C6E8C", width = 0.6) +
  scale_x_discrete(expand = expansion(mult = c(0.25, 0.25))) + # 左右留白
  geom_text(aes(label = round(entropy, 3)),
            vjust = -0.5, size = 4) +
  scale_y_continuous(limits = c(0, 3.5), expand = c(0, 0.01)) +
  labs(
    x = "Method",
    y = "Entropy"
  )+
  theme_classic()
pent
ggsave("pent_test.jpeg",pent,dpi = 400,width = 6, height = 4)


#4.4.1 Cross-Validation for Selecting Government Work Categories
my_colors <- c(
  "V1" = "lightsteelblue4",
  "V2" = "cadetblue3",
  "V3" = "steelblue3",
  "V4" = "skyblue3",
  "V5" = "lightsteelblue2"
)

p_perplexity <-ggplot(perplexity, aes(topics, value, color = folds)) +
  geom_point(size = 1.5) +
  scale_color_manual(values = my_colors) +    # ← 使用自定义色
  theme_classic() +
  labs(x = "Topics", y = "Perplexity",color = "Folds")+
  theme(axis.text = element_text(size = 10, colour = "black"),
        axis.title = element_text(size = 12, colour = "black"),
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 16),
        legend.position = "none") 
p_perplexity


p_perplexitySlopes <- ggplot(perplexity, aes(topics, slopes, color = folds)) +
  geom_point(size = 1.5) +
  geom_smooth(method = "gam", se = TRUE, aes(group = folds),color = "darkolivegreen3") +
  
  geom_vline(xintercept = 18, linetype = "dashed",
             color = "red", linewidth = 1) +
  
  scale_color_manual(values = my_colors) +  
  
  theme_classic() +
  theme(axis.text = element_text(size = 10, colour = "black"),
        axis.title = element_text(size = 12, colour = "black"),
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 16)) +
  labs(x = "Topics", y = "Perplexity_slopes", color = "Folds")

p_perplexity <- p_perplexity + theme(legend.position = "none")
p_perplexitySlopes <- p_perplexitySlopes+ theme(legend.position = "none")
p_combined <- p_perplexity + p_perplexitySlopes
p_combined
ggsave("p_combined.png", p_combined , width = 9, height = 5, dpi = 400)
